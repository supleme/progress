/*DEFINE VARIABLE teste AS CHARACTER   NO-UNDO.

PROMPT-FOR teste WITH SIDE-LABELS CENTER.

FOR EACH Order NO-LOCK WHERE Order.SalesRep = INPUT teste:
    DISPLAY Order.SalesRep
            Order.Ordernum 
            Order.CustNum 
            Order.OrderDate 
            Order.PromiseDate 
            Order.ShipDate
    WITH CENTERED WIDTH 599.
END.*/
/*CURRENT-WINDOW:WIDTH = 300.
DEFINE VARIABLE Teste AS CHARACTER   NO-UNDO.
PROMPT-FOR Teste WITH SIDE-LABELS CENTER.

FOR EACH Order NO-LOCK WHERE Order.SalesRep EQ INPUT Teste:
    DISPLAY Order.SalesRep
            Order.Ordernum 
            Order.CustNum 
            Order.OrderDate 
            Order.PromiseDate 
            Order.ShipDate
    WITH CENTERED WIDTH 599.
END.*//*
CURRENT-WINDOW:WIDTH = 300.
PROMPT-FOR Order.OrderNum. 
FIND Order USING OrderNum.
DISPLAY Order.CustNum Order.OrderStatus.
FIND Customer OF Order.
DISPLAY Customer.City Customer.Address WITH 1 COL WIDTH 599.*/

/*DEFINE VARIABLE teste AS CHARACTER   NO-UNDO.

PROMPT-FOR teste WITH SIDE-LABELS CENTER.

FOR EACH Order NO-LOCK WHERE Order.SalesRep = INPUT teste:
    DISPLAY 
    (FIND Order USING teste.
    DISPLAY Order.CustNum Order.OrderStatus.
    FIND Customer OF Order.
    DISPLAY Customer.City )



    WITH CENTERED WIDTH 599.
END.*/

REPEAT:
  PROMPT-FOR Item.ItemNum.
  FIND Item USING Item.ItemNum.
  DISPLAY Item.ItemNum Item.ItemName.
  REPEAT:
    FIND NEXT OrderLine OF Item.
    FIND Order OF OrderLine.
    FIND Customer WHERE Customer.CustNum = Order.CustNum.
    DISPLAY Customer.Name Order.OrderNum  OrderLine.Qty (TOTAL).
  END.
END. 
