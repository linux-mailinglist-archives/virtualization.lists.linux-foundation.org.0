Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 425EA11C044
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 00:05:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC1F7880DC;
	Wed, 11 Dec 2019 23:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IGYTj0FKSng; Wed, 11 Dec 2019 23:05:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F024088056;
	Wed, 11 Dec 2019 23:05:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C705DC18DC;
	Wed, 11 Dec 2019 23:05:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C69FC0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 23:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 600B988647
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 23:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juGeIkjAqiR8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 23:05:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DD4F488644
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 23:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576105516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzCxs9aqGoVRRSJ/w5jMdPmStCn+xcV/kLY/5cgYKb0=;
 b=MfyECy+yv+smwQF5dDxlFMuC2YCaWL5E4CqL0ic7IPhqYWsctq05ZBnos0IqXAuL2b7qWK
 AeuMeaTbdKJTMeRqD2oPmWIJtpu5DScDGTzqo1jeNbqHGPSrr+LobSG9nhlFK++XePu1VR
 NxfG0QQvIEWEodIdLtYHrAerxCfa08Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-hXOw3gxfOFqncxhTdrtzhw-1; Wed, 11 Dec 2019 18:05:12 -0500
Received: by mail-wm1-f71.google.com with SMTP id b131so164320wmd.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 15:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sx72Zu8R4y3Ns6A0Elwe6ONN3kNLN0tIVRBIzDH4IQA=;
 b=REwv457wMVR0T0FRe/88Hubt6qf/uu91MyqJMiB5Ym7OPhZjpURLaoV9e63l74NVMU
 2nkqyUdtRX9U93oiZFXvw4OqnTB7+voZJ2n6Y1t+pjEWpR1+Xwgyu1GIT2zeYFdn7TYJ
 ZO6LUiE4zs0ser3POPW3vzogSkqmISx6TuZjTzMsin7wJFkdAf9yYuV0ORPg6KsnC4bA
 v2MGiEL6TiGOD+7bbUN8deUd38GD2kQ50dsXHbFQMa8lp/tpStpyuoVhjvxpuq47mxpc
 QRbg7or12tw7s1WiI+WICfXTLVDkGudIxj4vgTla2KwROlHPeaDd1/e4OLdSMh3fJhdR
 rAqA==
X-Gm-Message-State: APjAAAU1lt2f4QNv+WyB+kU7r90NHG1Jfo7F+gwi6CJGZpgqyBs/dfPz
 CuBzZk918lsvRdeJrMtQjMoNG6WpAvh1c612uACgQ1s7RB2ln7bvi/CMoIHVYMK98gPqY/26vBt
 6cYZwQ9sYvyLA1UVme068dkutijurG+4AvmJ6xauFbw==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr2404646wma.121.1576105511577; 
 Wed, 11 Dec 2019 15:05:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpe9p8ejWiVLiuArWlu3PcE1o950G4BmpoXFY8faxUGRQT/Ci+xtr4RXgpMlISlS8MvrxukA==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr2404621wma.121.1576105511390; 
 Wed, 11 Dec 2019 15:05:11 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id g18sm3736144wmh.48.2019.12.11.15.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 15:05:10 -0800 (PST)
Date: Wed, 11 Dec 2019 18:05:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 15/24] compat_ioctl: scsi: move ioctl handling into drivers
Message-ID: <20191211180155-mutt-send-email-mst@kernel.org>
References: <20191211204306.1207817-1-arnd@arndb.de>
 <20191211204306.1207817-16-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191211204306.1207817-16-arnd@arndb.de>
X-MC-Unique: hXOw3gxfOFqncxhTdrtzhw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
 Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, y2038@lists.linaro.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 Kai =?iso-8859-1?Q?M=E4kisara?= <Kai.Makisara@kolumbus.fi>,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Doug Gilbert <dgilbert@interlog.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-scsi@vger.kernel.org
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

On Wed, Dec 11, 2019 at 09:42:49PM +0100, Arnd Bergmann wrote:
> Each driver calling scsi_ioctl() gets an equivalent compat_ioctl()
> handler that implements the same commands by calling scsi_compat_ioctl().
> 
> The scsi_cmd_ioctl() and scsi_cmd_blk_ioctl() functions are compatible
> at this point, so any driver that calls those can do so for both native
> and compat mode, with the argument passed through compat_ptr().
> 
> With this, we can remove the entries from fs/compat_ioctl.c.  The new
> code is larger, but should be easier to maintain and keep updated with
> newly added commands.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/block/virtio_blk.c |   3 +
>  drivers/scsi/ch.c          |   9 ++-
>  drivers/scsi/sd.c          |  50 ++++++--------
>  drivers/scsi/sg.c          |  44 ++++++++-----
>  drivers/scsi/sr.c          |  57 ++++++++++++++--
>  drivers/scsi/st.c          |  51 ++++++++------
>  fs/compat_ioctl.c          | 132 +------------------------------------
>  7 files changed, 142 insertions(+), 204 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 7ffd719d89de..fbbf18ac1d5d 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -405,6 +405,9 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
>  
>  static const struct block_device_operations virtblk_fops = {
>  	.ioctl  = virtblk_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl = blkdev_compat_ptr_ioctl,
> +#endif
>  	.owner  = THIS_MODULE,
>  	.getgeo = virtblk_getgeo,
>  };

Hmm - is virtio blk lumped in with scsi things intentionally?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
