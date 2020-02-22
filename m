Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 97037169179
	for <lists.virtualization@lfdr.de>; Sat, 22 Feb 2020 20:08:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D70786519;
	Sat, 22 Feb 2020 19:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83g2OmKTrr0h; Sat, 22 Feb 2020 19:08:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B0275865C7;
	Sat, 22 Feb 2020 19:08:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9251FC1D81;
	Sat, 22 Feb 2020 19:08:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00918C013E
 for <virtualization@lists.linux-foundation.org>;
 Sat, 22 Feb 2020 19:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F0F4585617
 for <virtualization@lists.linux-foundation.org>;
 Sat, 22 Feb 2020 19:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1m3rP2xtjZxB
 for <virtualization@lists.linux-foundation.org>;
 Sat, 22 Feb 2020 19:08:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CA6CF855B5
 for <virtualization@lists.linux-foundation.org>;
 Sat, 22 Feb 2020 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582398488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l8Co0LvRp3ramNpVW3gFF8vKkokm29L15IzKuQ8ukBs=;
 b=N3yYqLgt1MYVTihlsc1ik0bxlQPpjJGNmo0Jz/4NW/OpxwY6Xu/7LZj3jPA/D72jCNzHYj
 Ecb3Iadjj4eloXQ+IHpBmg+62AHr8Enxdmhk5UVJj+aVVAB0/F9dMcWyatQ5zlu6y+ZNir
 GpMI1lREA7bqh3/AIp8YIK/R8DbJuo0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-r5DoHEDPPE2EbQKxG3rZzg-1; Sat, 22 Feb 2020 14:08:04 -0500
X-MC-Unique: r5DoHEDPPE2EbQKxG3rZzg-1
Received: by mail-wm1-f69.google.com with SMTP id n17so1604531wmk.1
 for <virtualization@lists.linux-foundation.org>;
 Sat, 22 Feb 2020 11:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l8Co0LvRp3ramNpVW3gFF8vKkokm29L15IzKuQ8ukBs=;
 b=tk9HIYtYSmLET6dvE5GLcQ2WcsBGqxi/dxM148ZC2Eb1L1Im2784Bfc+rfuh9e4sqP
 nz3R+w27PyTExrXIDdAoydfjwTocbXm94yaEcvwYQMgAxHnnBD5s9AhcADFLMGqsb9V5
 Jz5Sb/LmNjii4w+epm1IyQrGTnbXVYHXu0LedTRmt5Vhg7ybiScRVjPBC0cJSpTCnWUc
 KuQLijCIE06rqlol0KcaFOzcLbSkA7DqvEqYJg7m56WtqEa9o79SaYFOGa+PDHpOGqA/
 hElkSmxa1Peo6d+DsVmzWw1ELPJzyoKK/5hH9Q2gAQ3mpDMdBXDkbm2UT7R02cEPl9LP
 Qadg==
X-Gm-Message-State: APjAAAVJNQnqBNEQB4ejCQOX6rJkQzkrgOVslbjLP1MaOlJ+nbAOrik2
 fgay+phtkmQkgQItuEfqv4tVPgfbCMZ7YCdQm8crMYcpmY2o7dwl6xwIpAKWzWemjEkDbob5zYF
 WWnhJ6BS8hpyZk9+2V/Xir8qjUG+gSaZxPJwa5Sx0JQ==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr11484209wmc.39.1582398483372; 
 Sat, 22 Feb 2020 11:08:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkw9wErSHWGp2TCjgAZ9qrXX7+D7Wndcr6dYdr8omT/WT5gNCQFRWrzivLVlKcFtBEcNGXcA==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr11484193wmc.39.1582398483111; 
 Sat, 22 Feb 2020 11:08:03 -0800 (PST)
Received: from redhat.com (bzq-79-178-2-214.red.bezeqint.net. [79.178.2.214])
 by smtp.gmail.com with ESMTPSA id
 m68sm9604715wme.48.2020.02.22.11.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 11:08:02 -0800 (PST)
Date: Sat, 22 Feb 2020 14:07:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 2/2] virtio: let virtio use DMA API when guest RAM is
 protected
Message-ID: <20200222140408-mutt-send-email-mst@kernel.org>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-3-pasic@linux.ibm.com>
 <20200220161309.GB12709@lst.de>
 <20200221153340.4cdcde81.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20200221153340.4cdcde81.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Fri, Feb 21, 2020 at 03:33:40PM +0100, Halil Pasic wrote:
> AFAIU you have a positive attitude towards the idea, that 
> !F_VIRTIO_PLATFORM implies 'no DMA API is used by virtio' 
> should be scrapped. 
> 
> I would like to accomplish that without adverse effects to virtio-ccw
> (because caring for virtio-ccw is a part of job description).
> 
> Regards,
> Halil

It is possible, in theory. IIRC the main challenge is that DMA API
has overhead of indirect function calls even when all it
does it return back the PA without changes. So that will lead to
a measureable performance degradation. That might be fixable,
possibly using some kind of logic along the lines of
	if (iova is pa)
		return pa
	else
		indirect call

and for unmapping, we might need an API that says "unmap
is a nop, safe to skip" so we don't maintain the
dma address until unmap.


-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
