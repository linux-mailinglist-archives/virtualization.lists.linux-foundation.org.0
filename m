Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 057A719BE85
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 11:24:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 83F6D20477;
	Thu,  2 Apr 2020 09:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YRl2NoUc69dz; Thu,  2 Apr 2020 09:24:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4430420457;
	Thu,  2 Apr 2020 09:24:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 157D0C1D74;
	Thu,  2 Apr 2020 09:24:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A665AC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 09:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9465B87871
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 09:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRpe8k+lPMIx
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 09:24:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5CEF4856C8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 09:24:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f6so2803380wmj.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QBLTad+iICgypznQbxOsc5K7y6BcjDBR3loOYsj8SjI=;
 b=Ozs9wvGWhInw+jHbV+TIbhn0mHoMFHCEFO25FeTvEMCTPyY7OHacXfEcXTiNoiBAeQ
 1VC8fPDraFaL2tn2VMqFbzjR1t79IdHS47FEvt89UccYOkek8UikchvvcScI+YAjAs3/
 TE8T3z8N4aqHw3WD5KZR9MWiTu/hQbk1lodhGs9xJG5gBFJa61Vrvi0K7VDctd344t/N
 /jNl1HvBSa9zNSpEP8Trto2aUS9cIST5YLl/mwd5+LO0lomPjvAW9JdePTMIqtmHn82N
 lN9l20L2TlPcVG4dnFhtolx0+Ct2YljEiGF98iw/XLHqCdoCP7NhtERc1Kweco00bYgX
 /fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QBLTad+iICgypznQbxOsc5K7y6BcjDBR3loOYsj8SjI=;
 b=rccdt20IwEOuWStBnRcCJGN/lxGArAMClqS0sbOGzHAnYXC7r7Uf/IJjRmthzCbk08
 pp8Y+6VXgO3y5k8WnrRfm+qL96NauObk3VFExJhVJONMc1oqaiR899CKTMBCyhgYFzWD
 4Da8lyT9Mvife0IW7ZohLFAZeweZx+uqOAfUS6RFGjDcLV6e30BXDOoQXC5wKIj7xqra
 uZT4rGnz4Gfw1oMKFDtyQIiGCH/9fnjC1LSNognN9Q1rly2f10ADYKfPRJikzHa8bAwG
 x5OLchkVom79Uymd8MBBIEnMqWUf3NwcjWQGKivSHpFtgdqCiLHjJKRhEfJARGtamdru
 FmwQ==
X-Gm-Message-State: AGi0PuZbuYgiyJvWW+lQCH+/zm1TNiTbnyPfptTPTuQR37/VbT93I/NV
 IJ7OrRgepioauHYJkpQlOv8SEw==
X-Google-Smtp-Source: APiQypI7yks1BQgHkRfqDIDPyzmNDQl3OkV9mh18UeW9nruJ9Kr3U7S557vz+0veoQwZ4Jzint1MtA==
X-Received: by 2002:a7b:cde8:: with SMTP id p8mr2493598wmj.87.1585819466713;
 Thu, 02 Apr 2020 02:24:26 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:6097:1406:6470:33b5])
 by smtp.gmail.com with ESMTPSA id f13sm6396383wrx.56.2020.04.02.02.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 02:24:26 -0700 (PDT)
Date: Thu, 2 Apr 2020 11:24:17 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [EXT] Re: [RFC PATCH v2] iommu/virtio: Use page size bitmap
 supported by endpoint
Message-ID: <20200402092417.GA1176452@myrica>
References: <20200401113804.21616-1-bbhushan2@marvell.com>
 <b75beb74-89ce-fd6a-6207-3c0d7f479215@arm.com>
 <20200401154932.GA1124215@myrica>
 <MWHPR1801MB19667BA1D59590BC3DFD87C7E3C60@MWHPR1801MB1966.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR1801MB19667BA1D59590BC3DFD87C7E3C60@MWHPR1801MB1966.namprd18.prod.outlook.com>
Cc: "mst@redhat.com" <mst@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
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

On Thu, Apr 02, 2020 at 03:53:40AM +0000, Bharat Bhushan wrote:
> > > > +struct virtio_iommu_probe_pgsize_mask {
> > > > +	struct virtio_iommu_probe_property	head;
> > > > +	__u8					reserved[4];
> > > > +	__u64					pgsize_bitmap;
> > 
> > Should be __le64
> 
> Based on" iommu/virtio: Fix sparse warning" patch https://www.spinics.net/lists/linux-virtualization/msg41944.html changed to __u64 (not __le64)

Yes that one was only for the virtio config struct, to play nice with
other devices. We should still use __le for the other structures,
including probe properties.

Thanks,
Jean

> 
> Will keep __le64.
> 
> Thanks
> -Bharat
> 
> > 
> > Thanks,
> > Jean
> > 
> > > > +};
> > > > +
> > > >   #define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
> > > >   #define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
> > > >
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
