Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F895686F7F
	for <lists.virtualization@lfdr.de>; Wed,  1 Feb 2023 21:02:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9BCC81F0D;
	Wed,  1 Feb 2023 20:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9BCC81F0D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aH2P6l3e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nXxMW9Qu00E; Wed,  1 Feb 2023 20:02:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 725C381EB5;
	Wed,  1 Feb 2023 20:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725C381EB5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 652A7C0077;
	Wed,  1 Feb 2023 20:02:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D54B4C0033
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Feb 2023 20:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A772541922
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Feb 2023 20:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A772541922
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=aH2P6l3e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCx0hg9SzHyw
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Feb 2023 20:02:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9065B4191C
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9065B4191C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Feb 2023 20:02:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21C7AB822A1;
 Wed,  1 Feb 2023 20:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1835C433EF;
 Wed,  1 Feb 2023 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675281766;
 bh=ze7tLLajYxPFA1rmGzEl6JCmS9yt5mfKFDsZEe6n59I=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=aH2P6l3eJrPgG0fg5gakMnS5Sk8NF+n3vMDCe6gzXJNEQ5QsjH54CzRhkkI9D3Db8
 zuyTxvCbmwjSWOhMQPgWNMUks31gw9UpX381vXf85S+PocYMDFZ2Mr7IdbQKG4uD3Z
 3o3YWC5LmbrlOwdMlw5MzhLZmGj8YzYpKg5Vly49JgJO2bVbHgf+h5uAyjrk5QBuJG
 Y9GTh7XZRujno7nypg2jUkw+xdUh6pfWzueMAhWUyyw3cobzJpJVw9eMTYvroYg1el
 zfQ2fRYWUaZSX/Hu/1VRA8I848emRFisRq9C4SyzIicu3MCxohn+cm0BzsARvpqnJ1
 8L0w7WR5JEpcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BD547E21ED2; Wed,  1 Feb 2023 20:02:46 +0000 (UTC)
Subject: Re: [GIT PULL] virtio,vhost,vdpa: fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230201110640-mutt-send-email-mst@kernel.org>
References: <20230201110640-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <netdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230201110640-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: 6b04456e248761cf68f562f2fd7c04e591fcac94
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f266ccaa2f5228bfe67ad58a94ca4e0109b954a
Message-Id: <167528176676.26493.9470166810574496838.pr-tracker-bot@kernel.org>
Date: Wed, 01 Feb 2023 20:02:46 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eric.auger@redhat.com, bcodding@redhat.com, 007047221b@gmail.com,
 viro@zeniv.linux.org.uk, mie@igel.co.jp,
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

The pull request you sent on Wed, 1 Feb 2023 11:06:40 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f266ccaa2f5228bfe67ad58a94ca4e0109b954a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
