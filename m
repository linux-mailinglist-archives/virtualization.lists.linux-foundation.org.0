Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 629631EFA12
	for <lists.virtualization@lfdr.de>; Fri,  5 Jun 2020 16:10:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD1F1255E3;
	Fri,  5 Jun 2020 14:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Header field occurs more than once: "To"
	occurs 3 times
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72BDrV9H7kIu; Fri,  5 Jun 2020 14:10:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4269B20449;
	Fri,  5 Jun 2020 14:10:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DF14C016E;
	Fri,  5 Jun 2020 14:10:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E067C016E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 14:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7226E20449
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 14:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Header field occurs more than once: "To"
 occurs 3 times
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFACHmH6VEwb
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 14:10:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 0F9E420394
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 14:10:51 +0000 (UTC)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AACEA207D3;
 Fri,  5 Jun 2020 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591366250;
 bh=ebgu688rDGjm6LNJM1GdCvl/C02ouX3iabU447jkzb0=;
 h=Date:From:To:To:To:CC:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Cc:Subject:
 In-Reply-To:References:From;
 b=eycV+JrDmk5b/2thl/HWl0hIocIAu1PnE/iuCoiSEzo8Zgj83uMeVpS/Tsu8gNPTn
 Qco8edeP97vS1Box7/AEVfxcfa1dBL3TgvDLclS5rClXFvJyepmXk72zhF5Vck53PP
 KDT05ZrNp9Nqk8H7meZ1MxPV98DG9yiNFqWbrm3M=
Date: Fri, 05 Jun 2020 14:10:50 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
To: <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] crypto: virtio: Fix dest length calculation in
 __virtio_crypto_skcipher_do_req()
In-Reply-To: <20200602070501.2023-4-longpeng2@huawei.com>
References: <20200602070501.2023-4-longpeng2@huawei.com>
Message-Id: <20200605141050.AACEA207D3@mail.kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
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
Content-Type: multipart/mixed; boundary="===============8260815466956534918=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============8260815466956534918==
Content-Type: text/plain

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: dbaf0624ffa5 ("crypto: add virtio-crypto driver").

The bot has tested the following trees: v5.6.15, v5.4.43, v4.19.125, v4.14.182.

v5.6.15: Build OK!
v5.4.43: Build failed! Errors:
    drivers/crypto/virtio/virtio_crypto_algs.c:408:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:408:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:408:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:408:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:408:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:408:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    ./include/linux/kernel.h:866:2: error: first argument to ‘__builtin_choose_expr’ not a constant

v4.19.125: Build failed! Errors:
    drivers/crypto/virtio/virtio_crypto_algs.c:422:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:422:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:422:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:422:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:422:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    drivers/crypto/virtio/virtio_crypto_algs.c:422:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’
    ./include/linux/kernel.h:870:2: error: first argument to ‘__builtin_choose_expr’ not a constant

v4.14.182: Build failed! Errors:
    drivers/crypto/virtio/virtio_crypto_algs.c:409:35: error: ‘struct ablkcipher_request’ has no member named ‘cryptlen’


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha

--===============8260815466956534918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8260815466956534918==--
