Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C249111CAB4
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 11:27:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C4AC8484F;
	Thu, 12 Dec 2019 10:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evL2dAQAcOti; Thu, 12 Dec 2019 10:27:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D27484AE2;
	Thu, 12 Dec 2019 10:27:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62CCFC0881;
	Thu, 12 Dec 2019 10:27:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1014AC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 10:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F272B8756C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 10:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qo+BAYkUw+jd
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 10:27:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B6091874E4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576146464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TtmlnKmQgGef92rPho0vws01NInaY/bIN4bKP2FE98=;
 b=TXRastDGJGpVhWAvGjjWEoj5klwI5N1eUqYUxX+2VcyuK4zLGsYmg87QERTWiEMEezEyxr
 rcLjR45ek4EZ3na03h8swfjCgeg0YxCDFCsa9oI6NJalJgicXmk0xam6+fmH2bEA94hm0F
 4gjakjac5Tw2jKiEh2F0eU7Octljm+8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-VyuFIwX2PfCd_ZWl3qbSRw-1; Thu, 12 Dec 2019 05:27:42 -0500
Received: by mail-qt1-f198.google.com with SMTP id d9so1073091qtq.13
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 02:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qU9B6VyDpHjtTgIgGRVPpWJk/W+j6466GBB3hhlYf7g=;
 b=PvfOtoShXXgJDqxEU6i0c0zhkA2DcBzgz4HRIiYQohzYxWNsASQ0KhrH4zgxrXoEsK
 s8y2YS42wJ/Ewpe0Jrm7It4MEt0fNw3dy4sKVux12mlNOcquCwizta6BmtAwbSe2Gpmi
 X3//JaRrJQ9bQncTV0cru5P5ZzGOChQPKOt0x7nGKK972YXn4fvFaAgkW6WO2f/dpG1t
 PRF+6rTMk4NL36q9Jek+7vDgDxM8XwYd8zoUO/2DJ2arIUY2lHFlaAoVnIW8mMOgl/FT
 /0vDhWtfVhvIPXcCljmI8MBXFn9WfiJvzyeqq17t+fNyxBWY+vkFlkS/NBHOHVm32fgi
 lAHQ==
X-Gm-Message-State: APjAAAW2budZnScALdmQNlN/516glnWeNlxhaADC7AE2ckUFw6MQ2D+4
 3Q5bOKnJtEspRySMhqRgPKsTXf7Kqsu6swyuD46xLZxHsDwQYY8q+3Eis3Fk7Ym5+BEDJfLwkAE
 Vl+Cl14JiA7xXVgZll5rkqn2ie6/fKVG+7kkkTB2fXA==
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr7283767qvo.55.1576146461808; 
 Thu, 12 Dec 2019 02:27:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtYqnSCAa6qS7eoPNNg8Gjl2R1rf+c6pT8ccpGnyGaK+GWirzetuKwnPIwjkwnOvZt6S9U2w==
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr7283726qvo.55.1576146461280; 
 Thu, 12 Dec 2019 02:27:41 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id 2sm1599671qkv.98.2019.12.12.02.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 02:27:40 -0800 (PST)
Date: Thu, 12 Dec 2019 05:27:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 15/24] compat_ioctl: scsi: move ioctl handling into drivers
Message-ID: <20191212052649-mutt-send-email-mst@kernel.org>
References: <20191211204306.1207817-1-arnd@arndb.de>
 <20191211204306.1207817-16-arnd@arndb.de>
 <20191211180155-mutt-send-email-mst@kernel.org>
 <858768fb-5f79-8259-eb6a-a26f18fb0e04@redhat.com>
MIME-Version: 1.0
In-Reply-To: <858768fb-5f79-8259-eb6a-a26f18fb0e04@redhat.com>
X-MC-Unique: VyuFIwX2PfCd_ZWl3qbSRw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, y2038@lists.linaro.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 Kai =?iso-8859-1?Q?M=E4kisara?= <Kai.Makisara@kolumbus.fi>,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Doug Gilbert <dgilbert@interlog.com>,
 linux-fsdevel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-scsi@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
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

On Thu, Dec 12, 2019 at 01:28:08AM +0100, Paolo Bonzini wrote:
> On 12/12/19 00:05, Michael S. Tsirkin wrote:
> >> @@ -405,6 +405,9 @@ static int virtblk_getgeo(struct block_device *bd, struct hd_geometry *geo)
> >>  
> >>  static const struct block_device_operations virtblk_fops = {
> >>  	.ioctl  = virtblk_ioctl,
> >> +#ifdef CONFIG_COMPAT
> >> +	.compat_ioctl = blkdev_compat_ptr_ioctl,
> >> +#endif
> >>  	.owner  = THIS_MODULE,
> >>  	.getgeo = virtblk_getgeo,
> >>  };
> > Hmm - is virtio blk lumped in with scsi things intentionally?
> 
> I think it's because the only ioctl for virtio-blk is SG_IO.

Oh right, I forgot about that one ...

>  It makes
> sense to lump it in with scsi, but I wouldn't mind getting rid of
> CONFIG_VIRTIO_BLK_SCSI altogether.
> 
> Paolo

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
