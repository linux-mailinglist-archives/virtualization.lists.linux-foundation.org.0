Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D686311EE3B
	for <lists.virtualization@lfdr.de>; Sat, 14 Dec 2019 00:10:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5F7D8203F3;
	Fri, 13 Dec 2019 23:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bs8YXetD68Kd; Fri, 13 Dec 2019 23:10:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C491D203EB;
	Fri, 13 Dec 2019 23:10:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 836B1C0881;
	Fri, 13 Dec 2019 23:10:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7523C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 23:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C1EE188866
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 23:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYuQgMu6kGa6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 23:10:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3BA2A87917
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 23:10:14 +0000 (UTC)
Subject: Re: [PULL] virtio: cleanups and fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576278613;
 bh=gaN6eYA24VQ2L4oceDEHAodf6zAVvVtpngVvrBOoTrQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=yGWsIpdGaBv4h8N3hZbouhx07axdCi2cpdIHUhXIG6mGm5oz5Qpag+oju3Lbbpevv
 MDmXaR7qSjjITTBHME1EA+VEFInpjEPqnEDKZHfPTZBWQtTMrTxSgK9nFwMCok0Yts
 O8rIPq39FCebQiZwdYKXcVLHEWNBhovoJj44WxXo=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191213093519-mutt-send-email-mst@kernel.org>
References: <20191213093519-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191213093519-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 63b9b80e9f5b2c463d98d6e550e0d0e3ace66033
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd79b5361a6ab3def4a577843ebfecd75b634c8b
Message-Id: <157627861383.1837.13487568040839175464.pr-tracker-bot@kernel.org>
Date: Fri, 13 Dec 2019 23:10:13 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: yuhuang@redhat.com, kvm@vger.kernel.org, netdev@vger.kernel.org,
 mst@redhat.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, imammedo@redhat.com,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 liuj97@gmail.com
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

The pull request you sent on Fri, 13 Dec 2019 09:35:19 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd79b5361a6ab3def4a577843ebfecd75b634c8b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
