Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1072917ECB5
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 00:40:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8D37088887;
	Mon,  9 Mar 2020 23:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRfcylafSyNA; Mon,  9 Mar 2020 23:40:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E46988889;
	Mon,  9 Mar 2020 23:40:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10D51C0177;
	Mon,  9 Mar 2020 23:40:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAC58C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 23:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 94F8488889
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 23:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Egwm-WA7UlFa
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 23:40:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 35DB788887
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 23:40:06 +0000 (UTC)
Subject: Re: [GIT PULL] virtio: fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583797205;
 bh=ZE2ffiezrvXnp/6PEvIpJmLiVf3FQc05fW0qI4CJcO8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ZW67oHegO+ZiXPdbxp5Tiq+zuBmfQaAN/vt40ncqjqpWgmoFi/3G70r38UnQfZEzI
 WzlK8MZS1fXimoMbMO0J6Mf7B0O4YnbxKaJyC8kjIHX8R0Oin7QJRDdZIRk01Jzp+f
 n/yTvJf6LdqU+/LfQ+6xDlsIDcz/pPDULL5949U4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200309040825-mutt-send-email-mst@kernel.org>
References: <20200309040825-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200309040825-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 6ae4edab2fbf86ec92fbf0a8f0c60b857d90d50f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7de41b120bb7fbe83bb46e7585c7346d21b93585
Message-Id: <158379720586.7202.3470781027361589881.pr-tracker-bot@kernel.org>
Date: Mon, 09 Mar 2020 23:40:05 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: axboe@kernel.dk, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 natechancellor@gmail.com, s-anna@ti.com,
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

The pull request you sent on Mon, 9 Mar 2020 04:08:25 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7de41b120bb7fbe83bb46e7585c7346d21b93585

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
