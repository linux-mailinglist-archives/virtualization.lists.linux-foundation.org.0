Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6CB1F55B7
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 15:24:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ACBB8203D2;
	Wed, 10 Jun 2020 13:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HleOD6bXQ69s; Wed, 10 Jun 2020 13:24:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 32EE020420;
	Wed, 10 Jun 2020 13:24:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FDCBC016F;
	Wed, 10 Jun 2020 13:24:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8991DC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 13:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7886C87DAD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 13:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UoJ-bY+lF6F5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 13:24:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BA8168769A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 13:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591795482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmumuHmMHhqlAParqxNQ/YNCBmzeBy/qMSsDffXs8Eo=;
 b=F3MhEMEMEwNjAnp+CNNbEkTJqNIxnT4deUFL6c6RGfW2ru4IDllHnvknKnrolDWXeqaRVL
 jRp1d1sRUmXTZJRCrMXPG9Yujf6gSUBtGbJSEwHlryKdB3dGrRz1XBM1rq2Ipti9Hzx4Oi
 tQi4uv87Ag/ocq7qbiG3pP5f3qAEGag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-HMY6qF-2Pqqun-sbMdrMqQ-1; Wed, 10 Jun 2020 09:24:40 -0400
X-MC-Unique: HMY6qF-2Pqqun-sbMdrMqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E45148014D9;
 Wed, 10 Jun 2020 13:24:38 +0000 (UTC)
Received: from gondolin (ovpn-112-196.ams2.redhat.com [10.36.112.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F39CE709D7;
 Wed, 10 Jun 2020 13:24:33 +0000 (UTC)
Date: Wed, 10 Jun 2020 15:24:31 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH] s390: protvirt: virtio: Refuse device without IOMMU
Message-ID: <20200610152431.358fded7.cohuck@redhat.com>
In-Reply-To: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
References: <1591794711-5915-1-git-send-email-pmorel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: linux-s390@vger.kernel.org, frankja@linux.ibm.com, kvm@vger.kernel.org,
 mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
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

On Wed, 10 Jun 2020 15:11:51 +0200
Pierre Morel <pmorel@linux.ibm.com> wrote:

> Protected Virtualisation protects the memory of the guest and
> do not allow a the host to access all of its memory.
> 
> Let's refuse a VIRTIO device which does not use IOMMU
> protected access.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  drivers/s390/virtio/virtio_ccw.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> index 5730572b52cd..06ffbc96587a 100644
> --- a/drivers/s390/virtio/virtio_ccw.c
> +++ b/drivers/s390/virtio/virtio_ccw.c
> @@ -986,6 +986,11 @@ static void virtio_ccw_set_status(struct virtio_device *vdev, u8 status)
>  	if (!ccw)
>  		return;
>  
> +	/* Protected Virtualisation guest needs IOMMU */
> +	if (is_prot_virt_guest() &&
> +	    !__virtio_test_bit(vdev, VIRTIO_F_IOMMU_PLATFORM))
> +			status &= ~VIRTIO_CONFIG_S_FEATURES_OK;
> +

set_status seems like an odd place to look at features; shouldn't that
rather be done in finalize_features?

>  	/* Write the status to the host. */
>  	vcdev->dma_area->status = status;
>  	ccw->cmd_code = CCW_CMD_WRITE_STATUS;

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
