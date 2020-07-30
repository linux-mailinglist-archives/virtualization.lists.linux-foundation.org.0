Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AF233C07
	for <lists.virtualization@lfdr.de>; Fri, 31 Jul 2020 01:20:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0715B868D9;
	Thu, 30 Jul 2020 23:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaw4PAVbXH6N; Thu, 30 Jul 2020 23:20:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C38B8621E;
	Thu, 30 Jul 2020 23:20:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CECF8C0864;
	Thu, 30 Jul 2020 23:20:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EE11C004D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 23:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3131220407
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 23:20:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isLwl6RH85Er
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 23:20:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 5E1D5203EB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 23:20:04 +0000 (UTC)
Subject: Re: [GIT PULL] virtio, qemu_fw: bugfixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596151204;
 bh=6+2lX73nW5UcKr93op0BObKpUW/HGBjFgSErTy2Tqf8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=XuQjCo6GkzM2EmF2FevkPLAT+vLyZNIU7urr1x0iEIBREBKuwkfHRo1TjWlr2Ta7e
 8J1pclEEe/Cv18yjUltiI2q4Wxn8agFitrxLbs/1fOHYxBVvkdK8z2y2v0UriM1eyv
 FI9pyPX0jjyJeFwTShcmDCHrAA09uBX7sx9iJ4kM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200730152958-mutt-send-email-mst@kernel.org>
References: <20200730152958-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200730152958-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: a96b0d061d476093cf86ca1c2de06fc57163588d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 417385c47ef7ee0d4f48f63f70cca6c1ed6355f4
Message-Id: <159615120411.31670.16532591701270206400.pr-tracker-bot@kernel.org>
Date: Thu, 30 Jul 2020 23:20:04 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: rdunlap@infradead.org, chenweilong@huawei.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, mst@redhat.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 wu000273@umn.edu, alexander.h.duyck@linux.intel.com,
 Linus Torvalds <torvalds@linux-foundation.org>
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

The pull request you sent on Thu, 30 Jul 2020 15:29:58 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/417385c47ef7ee0d4f48f63f70cca6c1ed6355f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
