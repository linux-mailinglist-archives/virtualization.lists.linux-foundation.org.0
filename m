Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 622E81E9D5F
	for <lists.virtualization@lfdr.de>; Mon,  1 Jun 2020 07:40:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0C0C02F622;
	Mon,  1 Jun 2020 05:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KznzdI6rpjdE; Mon,  1 Jun 2020 05:40:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3EAFC2DD21;
	Mon,  1 Jun 2020 05:37:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17BE5C0176;
	Mon,  1 Jun 2020 05:37:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F657C0178
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8AB8388A29
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQTYiUQE0UWN
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 055FE88A24
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 05:26:38 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ed491820001>; Sun, 31 May 2020 22:26:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 31 May 2020 22:26:38 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 31 May 2020 22:26:38 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Jun
 2020 05:26:38 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 1 Jun 2020 05:26:37 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.56.10]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ed4918c0004>; Sun, 31 May 2020 22:26:37 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/2] vhost, docs: convert to pin_user_pages(), new "case 5"
Date: Sun, 31 May 2020 22:26:31 -0700
Message-ID: <20200601052633.853874-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590989186; bh=oWhDekDqxx6fP3u/Pk90DFNTa0Jiv5OSfwybT44Pq1M=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Type:
 Content-Transfer-Encoding;
 b=njQ2XrKfA5W2d6S2irff3GXFlkhESnmMzdRVd0Q/6B60AxagwtZSbLa4o+uUZPcEC
 U9b4toQeqtCH2JLxeEdlYli0rRsWaLGGgu7lNzOE4A3V9yIjpiUmL++Z39WzDX8gm2
 Y+SEzR/8oWDaFDEpzI6OOPvRCeV1MdbdreDatwd//9coer0YaPfJARKz6KpKuJNuki
 i9df1soJa3Ku0wAC2kh8rE6HVP5UIGoO2FLioKhbkYmm1zpPOCFOrf+L8Fzx/m1u67
 U87MTtgDiMhF3FWGCf9o8p0f0Fzq6zhQsQoCWpyZ5HjHySh/7RDgDY46C0swvVZLfy
 +vVIjKS1sWtVQ==
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dave Chinner <david@fromorbit.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-fsdevel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
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

This is based on Linux 5.7, plus one prerequisite patch:
   "mm/gup: update pin_user_pages.rst for "case 3" (mmu notifiers)" [1]

Changes since v1: removed references to set_page_dirty*(), in response to
Souptick Joarder's review (thanks!).

Cover letter for v1, edited/updated slightly:

It recently became clear to me that there are some get_user_pages*()
callers that don't fit neatly into any of the four cases that are so
far listed in pin_user_pages.rst. vhost.c is one of those.

Add a Case 5 to the documentation, and refer to that when converting
vhost.c.

Thanks to Jan Kara for helping me (again) in understanding the
interaction between get_user_pages() and page writeback [2].

Note that I have only compile-tested the vhost.c patch, although that
does also include cross-compiling for a few other arches. Any run-time
testing would be greatly appreciated.

[1] https://lore.kernel.org/r/20200527194953.11130-1-jhubbard@nvidia.com
[2] https://lore.kernel.org/r/20200529070343.GL14550@quack2.suse.cz

John Hubbard (2):
  docs: mm/gup: pin_user_pages.rst: add a "case 5"
  vhost: convert get_user_pages() --> pin_user_pages()

 Documentation/core-api/pin_user_pages.rst | 18 ++++++++++++++++++
 drivers/vhost/vhost.c                     |  5 ++---
 2 files changed, 20 insertions(+), 3 deletions(-)


base-commit: 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
