Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C6F6DD30E
	for <lists.virtualization@lfdr.de>; Tue, 11 Apr 2023 08:41:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FA634017A;
	Tue, 11 Apr 2023 06:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FA634017A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QofxRbIK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgOL-dHFSE2m; Tue, 11 Apr 2023 06:41:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E59684056D;
	Tue, 11 Apr 2023 06:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E59684056D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FD2AC008C;
	Tue, 11 Apr 2023 06:41:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA2A4C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 06:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B13D41765
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 06:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B13D41765
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=QofxRbIK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1DpH3-CHAlB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 06:41:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CE374168D
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CE374168D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681195307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cir0Gnf4lO73dXx+ll4SEClofyoM/9KDMaw0DZ/d7mE=;
 b=QofxRbIKtfkK0IvPhnN8SbaabNav8SvxLeJPyKtvwN+ZIKHbPQDdDsN1BJ44d4GcsA61lV
 bQIKET7pvCJjUAxcl5Ma4ISuQ93rjN0PR/svvFi5gbkF9yUnNJKiRymG63MfNLUucCS38N
 Aql/UGYHCAwI/JZS9gheQD1DBDQs68w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-wulNWuO8Ozye6scgmNE9BQ-1; Tue, 11 Apr 2023 02:41:46 -0400
X-MC-Unique: wulNWuO8Ozye6scgmNE9BQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 gw11-20020a05600c850b00b003ee8db23ef9so4796941wmb.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Apr 2023 23:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681195305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cir0Gnf4lO73dXx+ll4SEClofyoM/9KDMaw0DZ/d7mE=;
 b=iOFmubB3qBvf6C7EsnpE8ODqtw9W/JE4s3ogeRoil9Ykx4NvnA5+AE6npiHCvHFoPh
 ON+58kxX0mVmo18boo7xerGo2rI42u9vcE3ufSczXW4ITSCWGfhA+4mvgMoNLq9ECOnb
 Fm0o1igVOzpY7hqv2H6IOB4OLRFye86Pu+5QatbUQdlArPV/oa5YnV3I1VdnMRNqDe/Q
 HDo5/6E8+Z9pl1ykSNBagZtiPDFgGtIU5on5LUKq/jZQaJVAjsGSmszfE7J9fcnMXYXN
 3vQjROCHOJbWGRNTIjR3tzdGTBc+0mH3C3mVTBy3mlhcQ2/eI8wqa8tw37lsLImRyPn8
 NAAA==
X-Gm-Message-State: AAQBX9fX5eLGvh4EsGDSjRmANgPNE8xHpe3unhMeA6nUwRm5rfe9k6av
 pERqdkdNWjAHOFwq8f9He/SEmih1qrmiMxWHEJIVgPTyZFfAKU2lvZlHfz2NjjKWioIvnHhxhAs
 JzeayH56AKGkA/yKxSV9ljWGg9723kbsJVEGDfeUNPg==
X-Received: by 2002:a5d:4b43:0:b0:2ef:b051:95c5 with SMTP id
 w3-20020a5d4b43000000b002efb05195c5mr6596129wrs.60.1681195305250; 
 Mon, 10 Apr 2023 23:41:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350aDk+askyEP9RLvZG0DjWMCmGyHnqPWpVQgma3u2M6tHEB57yytv6JeU13SIHx3VDd2TjQTtg==
X-Received: by 2002:a5d:4b43:0:b0:2ef:b051:95c5 with SMTP id
 w3-20020a5d4b43000000b002efb05195c5mr6596114wrs.60.1681195304960; 
 Mon, 10 Apr 2023 23:41:44 -0700 (PDT)
Received: from redhat.com ([2.52.10.80]) by smtp.gmail.com with ESMTPSA id
 w9-20020adfec49000000b002cde25fba30sm13785542wrn.1.2023.04.10.23.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 23:41:44 -0700 (PDT)
Date: Tue, 11 Apr 2023 02:41:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Angus Chen <angus.chen@jaguarmicro.com>
Subject: Re: [PATCH] virtio_pci: Wait for legacy device to be reset
Message-ID: <20230411024109-mutt-send-email-mst@kernel.org>
References: <20230411013833.1305-1-angus.chen@jaguarmicro.com>
 <20230411022329-mutt-send-email-mst@kernel.org>
 <TY2PR06MB34242144FB4F944DD866567B859A9@TY2PR06MB3424.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TY2PR06MB34242144FB4F944DD866567B859A9@TY2PR06MB3424.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

On Tue, Apr 11, 2023 at 06:39:16AM +0000, Angus Chen wrote:
> Hi mst.
> 
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, April 11, 2023 2:30 PM
> > To: Angus Chen <angus.chen@jaguarmicro.com>
> > Cc: jasowang@redhat.com; virtualization@lists.linux-foundation.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] virtio_pci: Wait for legacy device to be reset
> > 
> > On Tue, Apr 11, 2023 at 09:38:32AM +0800, Angus Chen wrote:
> > > We read the status of device after reset,
> > > It is not guaranteed that the device be reseted successfully.
> > 
> > Sorry not guaranteed by what? I am guessing you have a legacy device
> > that does not reset fully on write, and you need to wait?
>  When the card not finished reset, the read only return the middle state of card.
> > 
> > > We can use a while loop to make sure that,like the modern device did.
> > > The spec is not request it ,but it work.
> > >
> > > Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>
> > 
> > Generally I don't much like touching legacy, no telling what
> > that will do. Case in point, is your device a pure
> > legacy device or a transitional device?
>  Yes.,we have a real card which is use vitio spec.

So is it a transitional device?


>  Thank you.
> > 
> > > ---
> > >  drivers/virtio/virtio_pci_legacy.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
> > > index 2257f1b3d8ae..f2d241563e4f 100644
> > > --- a/drivers/virtio/virtio_pci_legacy.c
> > > +++ b/drivers/virtio/virtio_pci_legacy.c
> > > @@ -14,6 +14,7 @@
> > >   *  Michael S. Tsirkin <mst@redhat.com>
> > >   */
> > >
> > > +#include <linux/delay.h>
> > >  #include "linux/virtio_pci_legacy.h"
> > >  #include "virtio_pci_common.h"
> > >
> > > @@ -97,7 +98,8 @@ static void vp_reset(struct virtio_device *vdev)
> > >  	vp_legacy_set_status(&vp_dev->ldev, 0);
> > >  	/* Flush out the status write, and flush in device writes,
> > >  	 * including MSi-X interrupts, if any. */
> > > -	vp_legacy_get_status(&vp_dev->ldev);
> > > +	while (vp_legacy_get_status(&vp_dev->ldev))
> > > +		msleep(1);
> > 
> > The problem with this is that it will break surprise
> > removal even worse than it's already broken.
> > 
> > 
> > >  	/* Flush pending VQ/configuration callbacks. */
> > >  	vp_synchronize_vectors(vdev);
> > >  }
> > > --
> > > 2.25.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
