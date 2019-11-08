Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC25F51F4
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 18:04:03 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 94107EF7;
	Fri,  8 Nov 2019 17:02:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5AA26DE1
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:02:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 10ECE844
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 17:02:15 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D3D1621D7B;
	Fri,  8 Nov 2019 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573232534;
	bh=TBvj3ZAD/90gzZRZ4Bq7ZuAaAzf+ONWHDHtJ37qd9aY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=x6OOuDwHn0375jbO8T0CHJu4VFrTm+4reQ6H9i4/OduaNg9PuHeaqLsD9Cc7aN5uc
	BZh2RnBJUvSgPh4Zi3uk5VYzcI4RwV3uF6RCRrB2M5XT3/ex1h/cNKgFmotwZkGJ0N
	AnsKDTQSfZIEcITFJukKF69zGgyZsEHi2e45V5qc=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] checkpatch: Remove checks relating to
	[smp_]read_barrier_depends()
Date: Fri,  8 Nov 2019 17:01:20 +0000
Message-Id: <20191108170120.22331-14-will@kernel.org>
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

The '[smp_]read_barrier_depends()' macros no longer exist, so we don't
need to deal with them in the checkpatch script.

Signed-off-by: Will Deacon <will@kernel.org>
---
 scripts/checkpatch.pl | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 6fcc66afb088..7f5a368206bf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5787,8 +5787,7 @@ sub process {
 		my $barriers = qr{
 			mb|
 			rmb|
-			wmb|
-			read_barrier_depends
+			wmb
 		}x;
 		my $barrier_stems = qr{
 			mb__before_atomic|
@@ -5829,12 +5828,6 @@ sub process {
 			}
 		}
 
-# check for smp_read_barrier_depends and read_barrier_depends
-		if (!$file && $line =~ /\b(smp_|)read_barrier_depends\s*\(/) {
-			WARN("READ_BARRIER_DEPENDS",
-			     "$1read_barrier_depends should only be used in READ_ONCE or DEC Alpha code\n" . $herecurr);
-		}
-
 # check of hardware specific defines
 		if ($line =~ m@^.\s*\#\s*if.*\b(__i386__|__powerpc64__|__sun__|__s390x__)\b@ && $realfile !~ m@include/asm-@) {
 			CHK("ARCH_DEFINES",
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
