Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 275A83C88FA
	for <lists.virtualization@lfdr.de>; Wed, 14 Jul 2021 18:49:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FCBA60B17;
	Wed, 14 Jul 2021 16:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fhyg7y3ljhRV; Wed, 14 Jul 2021 16:49:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 24C36606CE;
	Wed, 14 Jul 2021 16:49:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE881C0027;
	Wed, 14 Jul 2021 16:49:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EC5CC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 16:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4151441639
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 16:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-5AKK1YkdLR
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 16:49:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C7424162A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 16:49:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B302D613C3;
 Wed, 14 Jul 2021 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626281359;
 bh=6SKB3Qqjs+EC5rQxtbZljNFZlyLM4HZOJZxqpbfl9sM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ko/UfbhD+PKfNZ3iK4ym6LzrxkwTJIAnlAs+qXdzedMZaGQBceXrGL4yO3Mhi8Yui
 vMOTVVJx+4Ujke2mPgfBk3Ht3ixeEAIiueMcl+Mt3nZdEGKe/obO9fAbsIwGZd2S1E
 wlHDb7pZo4ORM9aKt7vjHyClabpj5MHNp1aihZ0eiiUfnZphY1Cf8Si2OtplBMmvoA
 FklATVbj/QyXl8hG1qWEX00mxNkUQ0OdAccH8p4pfKml6iQ2yveG5hqAcabY/0PnHT
 ShhjQGUDah6fa1UE1UZsYnAqBBPNlHHBWN0dRxflqSplK04t3uzsQ1hpgqx1ZY+qSN
 8z4l8b9ME85bA==
Date: Wed, 14 Jul 2021 12:49:18 -0400
From: Sasha Levin <sashal@kernel.org>
To: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH AUTOSEL 4.4 08/31] drm/virtio: Fixes a potential NULL
 pointer dereference on probe failure
Message-ID: <YO8VjgdgHXoAcOMY@sashalap>
References: <20210706112931.2066397-1-sashal@kernel.org>
 <20210706112931.2066397-8-sashal@kernel.org>
 <20210712215937.GA9488@amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712215937.GA9488@amd>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, stable@vger.kernel.org
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

On Mon, Jul 12, 2021 at 11:59:37PM +0200, Pavel Machek wrote:
>Hi!
>
>> From: Xie Yongji <xieyongji@bytedance.com>
>>
>> [ Upstream commit 17f46f488a5d82c5568e6e786cd760bba1c2ee09 ]
>>
>> The dev->dev_private might not be allocated if virtio_gpu_pci_quirk()
>> or virtio_gpu_init() failed. In this case, we should avoid the cleanup
>> in virtio_gpu_release().
>
>The check is in wrong place at least in 4.4:
>
>> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
>> @@ -257,6 +257,9 @@ int virtio_gpu_driver_unload(struct drm_device *dev)
>>  	flush_work(&vgdev->config_changed_work);
>>  	vgdev->vdev->config->del_vqs(vgdev->vdev);
>>
>> +	if (!vgdev)
>> +		return;
>> +
>
>Pointer is dereferenced before being tested.

Heh, yes, thanks for catching that. I'll drop it for now and rework it
next week.

-- 
Thanks,
Sasha
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
