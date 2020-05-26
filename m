Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C31E23B5
	for <lists.virtualization@lfdr.de>; Tue, 26 May 2020 16:11:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88C258203A;
	Tue, 26 May 2020 14:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Header field occurs more than once: "To"
	occurs 3 times
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8TyG5LT83Om; Tue, 26 May 2020 14:11:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0118D82B51;
	Tue, 26 May 2020 14:11:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0BDDC016F;
	Tue, 26 May 2020 14:11:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D306C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 14:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 33D1623143
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 14:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Header field occurs more than once: "To"
 occurs 3 times
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCZGvFcI064N
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 14:11:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 0348C20425
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 14:11:38 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8410D207FB;
 Tue, 26 May 2020 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590502298;
 bh=wd1kdzjNu2wke/pcpNOmaZrZexqoLHk+Rig7xPRoVZo=;
 h=Date:From:To:To:To:CC:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:
 In-Reply-To:From;
 b=YAKDE/UROeEY6tF0J82oTKAi9+ResN3VFsHitMCrHGSSwnPlw0YT48tOSBHzs+MJz
 RmGEuGBmSLGlVocUWguShRPvFxFhGAIlnTVFxeKmGMBaV2hxMPmWL1kePFMh5uu0CE
 1VAnvnxcqxlqCaRMfL5KiRS7h/NQH2h0cQbofzoc=
Date: Tue, 26 May 2020 14:11:37 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] crypto: virtio: Fix use-after-free in
 virtio_crypto_skcipher_finalize_req()
In-Reply-To: <20200526031956.1897-3-longpeng2@huawei.com>
Message-Id: <20200526141138.8410D207FB@mail.kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Markus Elfring <Markus.Elfring@web.de>,
 "Longpeng\(Mike\)" <longpeng2@huawei.com>,
 "David S. Miller" <davem@davemloft.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

<20200123101000.GB24255@Red>
References: <20200526031956.1897-3-longpeng2@huawei.com>
<20200123101000.GB24255@Red>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: dbaf0624ffa5 ("crypto: add virtio-crypto driver").

The bot has tested the following trees: v5.6.14, v5.4.42, v4.19.124, v4.14.181.

v5.6.14: Build OK!
v5.4.42: Failed to apply! Possible dependencies:
    eee1d6fca0a0 ("crypto: virtio - switch to skcipher API")

v4.19.124: Failed to apply! Possible dependencies:
    eee1d6fca0a0 ("crypto: virtio - switch to skcipher API")

v4.14.181: Failed to apply! Possible dependencies:
    500e6807ce93 ("crypto: virtio - implement missing support for output IVs")
    67189375bb3a ("crypto: virtio - convert to new crypto engine API")
    d0d859bb87ac ("crypto: virtio - Register an algo only if it's supported")
    e02b8b43f55a ("crypto: virtio - pr_err() strings should end with newlines")
    eee1d6fca0a0 ("crypto: virtio - switch to skcipher API")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
