Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F02232FE5B2
	for <lists.virtualization@lfdr.de>; Thu, 21 Jan 2021 10:00:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 95072860F9;
	Thu, 21 Jan 2021 09:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZUDDzctZXnx; Thu, 21 Jan 2021 09:00:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 254CF86113;
	Thu, 21 Jan 2021 09:00:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F13C9C013A;
	Thu, 21 Jan 2021 09:00:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 056B0C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 09:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CCE86860F9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 09:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iQtNB-B-bGg
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 09:00:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E44A9860B2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611219643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+1P7b60HaR2MAzWv8XFsDjrssAyoeWJipGT+zaJVmE=;
 b=WIgCLIc98D/mVtehfsc0KhUW2TVB4bNP1B4YGP3unlLimQbP0t/WSjljHtBKQiFKH1LMuP
 UAw1kNgPgnTFHPmiSy7jgBN5WuxUsUAXSzr0ygkDxmcF9o+51YQ+6Pca7EYgkTOFgr46jW
 v77o+rjs2Tp41JMHREN1kyPV4eb6UWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-jDmMz9WnOKKAMlu3hfLq8w-1; Thu, 21 Jan 2021 04:00:39 -0500
X-MC-Unique: jDmMz9WnOKKAMlu3hfLq8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DA241005D4E;
 Thu, 21 Jan 2021 09:00:38 +0000 (UTC)
Received: from [10.72.13.67] (ovpn-13-67.pek2.redhat.com [10.72.13.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7D0819C46;
 Thu, 21 Jan 2021 09:00:26 +0000 (UTC)
Subject: Re: [PATCH 1/1] vhost scsi: allocate vhost_scsi with GFP_NOWAIT to
 avoid delay
To: Dongli Zhang <dongli.zhang@oracle.com>,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 netdev@vger.kernel.org
References: <20210121050328.7891-1-dongli.zhang@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3aa5c6ca-abd3-13c4-b6a6-504f3a52bae7@redhat.com>
Date: Thu, 21 Jan 2021 17:00:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121050328.7891-1-dongli.zhang@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: aruna.ramakrishna@oracle.com, mst@redhat.com, joe.jin@oracle.com,
 linux-kernel@vger.kernel.org, stefanha@redhat.com, pbonzini@redhat.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


On 2021/1/21 13:03, Dongli Zhang wrote:
> The size of 'struct vhost_scsi' is order-10 (~2.3MB). It may take long time
> delay by kzalloc() to compact memory pages when there is a lack of
> high-order pages. As a result, there is latency to create a VM (with
> vhost-scsi) or to hotadd vhost-scsi-based storage.
>
> The prior commit 595cb754983d ("vhost/scsi: use vmalloc for order-10
> allocation") prefers to fallback only when really needed, while this patch
> changes allocation to GFP_NOWAIT in order to avoid the delay caused by
> memory page compact.
>
> Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
> Another option is to rework by reducing the size of 'struct vhost_scsi',
> e.g., by replacing inline vhost_scsi.vqs with just memory pointers while
> each vhost_scsi.vqs[i] should be allocated separately. Please let me
> know if that option is better.
>
>   drivers/vhost/scsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> index 4ce9f00ae10e..85eaa4e883f4 100644
> --- a/drivers/vhost/scsi.c
> +++ b/drivers/vhost/scsi.c
> @@ -1814,7 +1814,7 @@ static int vhost_scsi_open(struct inode *inode, struct file *f)
>   	struct vhost_virtqueue **vqs;
>   	int r = -ENOMEM, i;
>   
> -	vs = kzalloc(sizeof(*vs), GFP_KERNEL | __GFP_NOWARN | __GFP_RETRY_MAYFAIL);
> +	vs = kzalloc(sizeof(*vs), GFP_NOWAIT | __GFP_NOWARN);
>   	if (!vs) {
>   		vs = vzalloc(sizeof(*vs));
>   		if (!vs)


Can we use kvzalloc?

Thanks


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
