Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334663A067
	for <lists.virtualization@lfdr.de>; Mon, 28 Nov 2022 05:15:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E099B81428;
	Mon, 28 Nov 2022 04:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E099B81428
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=Ho15znAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2LZc527UvY_T; Mon, 28 Nov 2022 04:15:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B3F8E81418;
	Mon, 28 Nov 2022 04:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F8E81418
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC1FFC007C;
	Mon, 28 Nov 2022 04:15:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D23DC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 04:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6734F60F61
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 04:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6734F60F61
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net
 header.a=rsa-sha256 header.s=dreamhost header.b=Ho15znAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id so0U1-326CVf
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 04:15:19 +0000 (UTC)
X-Greylist: delayed 00:07:58 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06C9C60F53
Received: from hamster.birch.relay.mailchannels.net
 (hamster.birch.relay.mailchannels.net [23.83.209.80])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06C9C60F53
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Nov 2022 04:15:18 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 23DD87E127D;
 Mon, 28 Nov 2022 04:07:20 +0000 (UTC)
Received: from pdx1-sub0-mail-a283.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id A7BAB7E1166;
 Mon, 28 Nov 2022 04:07:19 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1669608439; a=rsa-sha256;
 cv=none;
 b=tFfK4ixp93bDmAShb2iCHGG+wo1pi8kLs7vMWCP/iK1lgXlMuhcXTuGy2HwopnhyQSvs6r
 O4jDW/eUoNTStIUlYI0OjpEDrFeuqkBwb7PyELO3dS6SyHBYAr4BlPo2vHg+6P4/BeAyRy
 HuuSrInFxLpEg9HUKEoqAMwk/m03sC2MvBn2z7sfTaB8SFNRHE+FVgh8KzQKEJ5tLJ+vol
 9YpW1noKgoCGYIhEgOFIUafIKg6/cr1hZjtTlFUVTHnnkMR11fykPUYV1muloDy6kZ8zUp
 8ICL2bn5gq68TB3yKgYfchIBhmeBjD3vC0HZPTYaKAkLGcvFb0jA+suQCowPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1669608439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=Vmw3reQPrur1xJKRLRqYBcEKBf5q3vUoCqozNv9an40=;
 b=It1qrLA1DyKaC3uD9gO45XNzofQLE3tCNiw64anxtV5s5Ne7eglfZBdqE3zahcpv0EWqt2
 EMgcSwXd91Wz7KwT/phryPzcbj9/iWl2EnPDOeeeG2XkbjQ8A9M4Br4K8kP5eBiNXxVAYi
 XnRlHIqo8XPPhed2lbad5lC4Qdgga21JC9XI3pjw38w9LfGqOT/ozx7AOKAnn+/IN2im09
 1jaD4IjrPcuSa3SFU/pciZLwawmAsvl2KyMV62qPNoztlpPRDY8d9Ixbr/J/lhonxX77V0
 48BzJK8BDCIzB7mM3hU9tOX/ewepPDc0R9mSxH4ZgdVMGzXR3dgX4fk8x7HtsA==
ARC-Authentication-Results: i=1; rspamd-84789cff4b-64tzg;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Print-Trade: 6469a99d2185b3ca_1669608439927_3751063851
X-MC-Loop-Signature: 1669608439927:2333882591
X-MC-Ingress-Time: 1669608439926
Received: from pdx1-sub0-mail-a283.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.74.61 (trex/6.7.1); Mon, 28 Nov 2022 04:07:19 +0000
Received: from localhost.localdomain (ip72-199-50-187.sd.sd.cox.net
 [72.199.50.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a283.dreamhost.com (Postfix) with ESMTPSA id 4NLBkb1BL4z3Q; 
 Sun, 27 Nov 2022 20:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1669608439;
 bh=Vmw3reQPrur1xJKRLRqYBcEKBf5q3vUoCqozNv9an40=;
 h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
 b=Ho15znAF2TEBhRs5jeuIkT2EARsjnYzUYYYBr0IHD9hXLQ7ctqn9XFjJcM4m4AmSV
 FEQYPFAbC1OLavHfUEmMpJqdCV8tvdH1eYWaQwHWLQzGHNRABKmF6TCJIs53+yrCXD
 3f9oLBnASuroV+kL/hnEU7tAI+l6TOL3yUxilo/XscsRCIYIf3+oH3dkv+kP5Yi93U
 yXcc2woonp0I4vUrFJPp8xz2+rM/coOvbQ9nJwazpw5dSnYAimFW6b2ZFjHskvrjPr
 1W4XKgLffjpTthdMpOxPRJgzOWmY2sANBqKusMz0AUy18EAWQKw2iANA+Wzc1iKj31
 fPhEOcLzI8mww==
From: Davidlohr Bueso <dave@stgolabs.net>
To: mst@redhat.com
Subject: [PATCH 0/2] tools/virtio: remove smp_read_barrier_depends()
Date: Sun, 27 Nov 2022 19:43:45 -0800
Message-Id: <20221128034347.990-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: dave@stgolabs.net, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Hi,

To my surprise, this call is still git-greppable in the
tree, the kernel having gotten rid of it a while back.

Thanks!

Davidlohr Bueso (2):
  tools/virtio: remove stray characters
  tools/virtio: remove smp_read_barrier_depends()

 tools/virtio/ringtest/main.h | 37 +++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

-- 
2.38.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
