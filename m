Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D129A181C27
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 16:17:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F727872B3;
	Wed, 11 Mar 2020 15:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJ1-jIescaM6; Wed, 11 Mar 2020 15:17:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12F8086B85;
	Wed, 11 Mar 2020 15:17:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E75FBC0177;
	Wed, 11 Mar 2020 15:17:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A418C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2971886B57
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-fH1Y-KsUSH
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:17:50 +0000 (UTC)
X-Greylist: delayed 00:23:37 by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7895386B85
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Mime-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=V5VwQ3DE+z7Gin8QWO2wlhFBBFKjYu8MYUyeDZvDjTA=; b=s7mN0sk0ngR79fsppXGLXlZ25a
 BbEbycKQ6SlQpPxENYqRwMB3Ui4KjmHwO8VuX+i/7Gcp6xhg07dPwX2TQDU9gfA6O9DbWuUWrx9oN
 5voV9t1b+QRgSacgBtgO/BSXQaOZJILYXddD+l6j1yh6WN3NHXhuh2UkkLcnWjJ0GJ2BaMrjS0Vyk
 mogt6hgkeMc3gs+2RlX7SpqbSZeij2R1crYr/BrNDaR4LT18Ej5OBoP0h6/SlRDYye4ylj4gsLNmN
 vlJkiVIPrWRgf0kUpoSf8/2npEwkHMNJ6bYx/OA78Kbc3tRTcIKYjClnz09vNknffTV/2d2U/amsp
 RicCxsqQ==;
Received: from [54.239.6.186] (helo=u0c626add9cce5a.drs10.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC2kC-0000sD-0Z; Wed, 11 Mar 2020 14:54:00 +0000
Message-ID: <f09bacf3029edfc7f90097f7fc6e41176ddd4873.camel@kernel.org>
Subject: Re: [PATCH] virtio: virtio_console: add missing
 MODULE_DEVICE_TABLE() for rproc serial
From: Amit Shah <amit@kernel.org>
To: Alexander Lobakin <alobakin@dlink.ru>
Date: Wed, 11 Mar 2020 15:53:56 +0100
In-Reply-To: <20200310110538.19254-1-alobakin@dlink.ru>
References: <20200310110538.19254-1-alobakin@dlink.ru>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Sjur Brandeland <sjur.brandeland@stericsson.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, 2020-03-10 at 14:05 +0300, Alexander Lobakin wrote:
> rproc_serial_id_table lacks an exposure to module devicetable, so
> when remoteproc firmware requests VIRTIO_ID_RPROC_SERIAL, no uevent
> is generated and no module autoloading occurs.
> Add missing MODULE_DEVICE_TABLE() annotation and move the existing
> one for VIRTIO_ID_CONSOLE right to the table itself.
> 
> Fixes: 1b6370463e88 ("virtio_console: Add support for remoteproc
> serial")
> Cc: <stable@vger.kernel.org> # v3.8+
> Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>

Reviewed-by: Amit Shah <amit@kernel.org>

Thanks,

> ---
>  drivers/char/virtio_console.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/virtio_console.c
> b/drivers/char/virtio_console.c
> index 4df9b40d6342..7e1bc0f580a2 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -2116,6 +2116,7 @@ static struct virtio_device_id id_table[] = {
>  	{ VIRTIO_ID_CONSOLE, VIRTIO_DEV_ANY_ID },
>  	{ 0 },
>  };
> +MODULE_DEVICE_TABLE(virtio, id_table);
>  
>  static unsigned int features[] = {
>  	VIRTIO_CONSOLE_F_SIZE,
> @@ -2128,6 +2129,7 @@ static struct virtio_device_id
> rproc_serial_id_table[] = {
>  #endif
>  	{ 0 },
>  };
> +MODULE_DEVICE_TABLE(virtio, rproc_serial_id_table);
>  
>  static unsigned int rproc_serial_features[] = {
>  };
> @@ -2280,6 +2282,5 @@ static void __exit fini(void)
>  module_init(init);
>  module_exit(fini);
>  
> -MODULE_DEVICE_TABLE(virtio, id_table);
>  MODULE_DESCRIPTION("Virtio console driver");
>  MODULE_LICENSE("GPL");

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
