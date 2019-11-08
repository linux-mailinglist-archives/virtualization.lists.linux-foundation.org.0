Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 430CBF51E5
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 18:01:58 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5AE20ED4;
	Fri,  8 Nov 2019 17:01:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8460FEAE
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 502FC8C5
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:01:35 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 15698218AE;
	Fri,  8 Nov 2019 17:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573232495;
	bh=8576erlpBEecdBZLwaAf1hANQyRlAVg5w9VzhgYn1N4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mQPLKMFTmKtUZrfE3t7fIwnKcTB8Q4GrSwDBG6Plp2pjYB/4SEURJMylIYjxap80C
	9jQhqVE8V7fknpdFh1PU4i5Wri22OGwEnaDY7uqEqHlzbj3LH2qi1A5wN473to2iaS
	xhDH1bVxYwWCkKi2t5TgPxVPltHPTMheMiRG/sTQ=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] READ_ONCE: Undefine internal __READ_ONCE_SIZE macro
	after use
Date: Fri,  8 Nov 2019 17:01:09 +0000
Message-Id: <20191108170120.22331-3-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108170120.22331-1-will@kernel.org>
References: <20191108170120.22331-1-will@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Josh Triplett <josh@joshtriplett.org>, Yunjae Lee <lyj7694@gmail.com>,
	SeongJae Park <sj38.park@gmail.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	linux-alpha@vger.kernel.org, Joe Perches <joe@perches.com>,
	Alan Stern <stern@rowland.harvard.edu>, Matt Turner <mattst88@gmail.com>,
	virtualization@lists.linux-foundation.org,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Richard Henderson <rth@twiddle.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The '__READ_ONCE_SIZE()' macro is only used as part of building
'READ_ONCE()', so undefine it once we don't need it anymore.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/asm-generic/rwonce.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
index d189455ae038..abf326634ecd 100644
--- a/include/asm-generic/rwonce.h
+++ b/include/asm-generic/rwonce.h
@@ -59,6 +59,8 @@ void __read_once_size_nocheck(const volatile void *p, void *res, int size)
 	__READ_ONCE_SIZE;
 }
 
+#undef __READ_ONCE_SIZE
+
 static __always_inline void __write_once_size(volatile void *p, void *res, int size)
 {
 	switch (size) {
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
