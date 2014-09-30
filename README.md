UIView-FrameUtils
=================

UIView Category for working with frames

Added Properties
----------------

* @property (nonatomic) CGFloat x;
* @property (nonatomic) CGFloat y;
* @property (nonatomic) CGFloat midX;
* @property (nonatomic) CGFloat midY;
* @property (nonatomic) CGFloat maxX;
* @property (nonatomic) CGFloat maxY;
* @property (nonatomic) CGFloat width;
* @property (nonatomic) CGFloat height;


Added Methods
-------------
**X/Y**

* -(void)setX:(CGFloat)x andY:(CGFloat)y;
* -(void)offsetX:(CGFloat)x andY:(CGFloat)y;

**Height/Width**
* -(void)setWidth:(CGFloat)width andHeight:(CGFloat)height;
* -(void)scaleSizeByFactor:(CGFloat)factor;

**Centering**
* -(void)centerXWithRect:(CGRect)rect;
* -(void)centerYWithRect:(CGRect)rect;
* -(void)centerWithRect:(CGRect)rect;

* -(void)centerXInParent;
* -(void)centerYInParent;
* -(void)centerInParent;

* -(void)centerXInRect:(CGRect)rect;
* -(void)centerYInRect:(CGRect)rect;
* -(void)centerInRect:(CGRect)rect;

* -(void)centerInScreen;
