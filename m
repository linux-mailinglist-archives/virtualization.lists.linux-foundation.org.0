Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E51082DBB52
	for <lists.virtualization@lfdr.de>; Wed, 16 Dec 2020 07:42:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A3B9787264;
	Wed, 16 Dec 2020 06:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3yGWc4TgCFj; Wed, 16 Dec 2020 06:42:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3DFF8872C3;
	Wed, 16 Dec 2020 06:42:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CF17C013B;
	Wed, 16 Dec 2020 06:42:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BC09C013B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3AAEE8725D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPQPNKKgz7Mf
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:42:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C9DEE87264
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608100937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3UWP1wA+TmXEYFaObG+gNlM2R7JNPVOrtlzVhMwTG98=;
 b=ERYDxSz1nQ782phxpymZBS22u+CBKoEUWVGg7QR7fPnfWrzraVV0v2R5jajSZ5QxvZuu7C
 LQ4H4yfBiYAk22RHiEX39TT52IKx8roe1HJj0ZeCIWuCYIGUtqHdC0ny06Rl+AZz03YyzM
 6Vy/QsDkN+qZXh4paWOKUS6Pp03KvaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-tP-Nw1d0PK-J9a5BMA-bCQ-1; Wed, 16 Dec 2020 01:42:13 -0500
X-MC-Unique: tP-Nw1d0PK-J9a5BMA-bCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A1C9803F60;
 Wed, 16 Dec 2020 06:42:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03E6C72F80;
 Wed, 16 Dec 2020 06:42:08 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D777518095C9;
 Wed, 16 Dec 2020 06:42:07 +0000 (UTC)
Date: Wed, 16 Dec 2020 01:41:48 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <613214145.36646222.1608100908658.JavaMail.zimbra@redhat.com>
In-Reply-To: <1330503106.36174346.1608098013639.JavaMail.zimbra@redhat.com>
References: <d2ae0b1d-332b-42a1-87bf-7da2b749cac2@sect.tu-berlin.de>
 <20201214214950.GC18103@char.us.oracle.com>
 <c3629a27-3590-1d9f-211b-c0b7be152b32@redhat.com>
 <20201215142755.GB28810@char.us.oracle.com>
 <1330503106.36174346.1608098013639.JavaMail.zimbra@redhat.com>
Subject: Re: swiotlb/virtio: unchecked device dma address and length
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.29]
Thread-Topic: swiotlb/virtio: unchecked device dma address and length
Thread-Index: PEkMXKnONb0rkBpXq/L9SkUhNE40FYnhNR02
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: ashish kalra <ashish.kalra@amd.com>,
 Felicitas Hetzelt <file@sect.tu-berlin.de>,
 Martin Radev <martin.radev@aisec.fraunhofer.de>,
 david kaplan <david.kaplan@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Robert Buhren <robert@sect.tu-berlin.de>, iommu@lists.linux-foundation.org,
 Mathias Morbitzer <mathias.morbitzer@aisec.fraunhofer.de>, hch@lst.de
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



----- Original Message -----
> 
> 
> ----- Original Message -----
> > .snip.
> > > > > This raises two issues:
> > > > > 1) swiotlb_tlb_unmap_single fails to check whether the index
> > > > > generated
> > > > > from the dma_addr is in range of the io_tlb_orig_addr array.
> > > > That is fairly simple to implement I would think. That is it can check
> > > > that the dma_addr is from the PA in the io_tlb pool when SWIOTLB=force
> > > > is used.
> > > 
> > > 
> > > I'm not sure this can fix all the cases. It looks to me we should map
> > > descriptor coherent but readonly (which is not supported by current DMA
> > > API).
> > 
> > I think I am missing something obvious here. The attacker is the
> > hypervisor,
> > aka
> > the owner of the VirtIO device (ring0). The attacker is the one that
> > provides the addr/len - having that readonly from a guest perspective
> > does not change the fact that the hypervisor can modify the memory range
> > by mapping it via a different virtual address in the hypervisor? (aka
> > aliasing it).
> 
> Right, but if we allow hypervisor to provide arbitrary addr/len, does
> it mean hypervisor can read encrypted content of encrypted memory of
> guest through swiotlb?
> 
> Thanks

Actually not. I think you're right.

Thanks

> 
> > > 
> > > Otherwise, device can modify the desc[i].addr/desc[i].len at any time to
> > > pretend a valid mapping.
> > 
> > With the swiotlb=force as long as addr/len are within the PA boundaries
> > within the SWIOTLB pool this should be OK?
> > 
> > After all that whole area is in cleartext and visible to the attacker.
> > 
> > 
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
