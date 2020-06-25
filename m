Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 853BD209803
	for <lists.virtualization@lfdr.de>; Thu, 25 Jun 2020 02:50:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32BBD869D1;
	Thu, 25 Jun 2020 00:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZsSlYqBNR0R; Thu, 25 Jun 2020 00:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5AA9F868B6;
	Thu, 25 Jun 2020 00:50:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CA42C016F;
	Thu, 25 Jun 2020 00:50:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CA22C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 00:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 550B788072
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 00:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypKBRZTuupNj
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 00:50:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 17FE18807C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 00:50:18 +0000 (UTC)
Subject: Re: [GIT PULL] virtio: fixes, tests
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593046217;
 bh=f5RpbcMicbBxqObbdGqeqMmJL+IlXXFRGH9AYmoYkCw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=E0ffJ/zhU2HgdXfI+8AHlU+ReBaqcI6rA6uBDkTFVZ2qAfrK/T0xNbEVUXBgBGTJZ
 T9+/YV8d5biZfPFK9qxDQ6xzp7ARyhDJjrrrSnyjFeyYDIhtu8t7M9B+3n3cNFAdYk
 dNpaciYRpMJuSzfvwCfs7qyOEfTYV7ld9bH+Ucdk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200624050801-mutt-send-email-mst@kernel.org>
References: <20200624050801-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200624050801-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: cb91909e48a4809261ef4e967464e2009b214f06
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc10807db5ced090d83cec167e87c95a47452d24
Message-Id: <159304621781.794.13739731253523627902.pr-tracker-bot@kernel.org>
Date: Thu, 25 Jun 2020 00:50:17 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: pankaj.gupta.linux@gmail.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 teawaterz@linux.alibaba.com, Linus Torvalds <torvalds@linux-foundation.org>,
 dan.carpenter@oracle.com
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

The pull request you sent on Wed, 24 Jun 2020 05:08:01 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc10807db5ced090d83cec167e87c95a47452d24

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
