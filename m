Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 617F4310F99
	for <lists.virtualization@lfdr.de>; Fri,  5 Feb 2021 19:13:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F3FC02E12B;
	Fri,  5 Feb 2021 18:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XA65F-nMIB+k; Fri,  5 Feb 2021 18:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1DA752E129;
	Fri,  5 Feb 2021 18:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF973C013A;
	Fri,  5 Feb 2021 18:13:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46384C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 18:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3B52920372
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 18:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TfPwXtTj8A9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 18:12:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id BE1122E12B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 18:12:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A41064E49;
 Fri,  5 Feb 2021 18:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612548777;
 bh=OEdo9FgWHCfNz1W4m5jQ8e6zfGEvZ8qUY/UkHoGEWXA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=SV2rfU2qRQ15Rr/3zIRHopOucvCIp5MECi1h0m4HSokeQmDfZO6iingAuJk/mbYDG
 b51bX2UmrwO7iwY642mCbyCEDlFmp4z+qOm+W6EPeZzL2+LdmPtfRAAtzXMqF6stdH
 86rOJBQ0+JGuBVbcTUu7JoYv5aWbVVVTAFAvKsCnn/dBi7P4UFDkq1l8fQmPDx9Urb
 wweqaC4MB3Za/u3HAG36UhnvYvbh0rm+L35FBnaWnOqFmYBp35GsqsWjhYQcWFZiMp
 ZNIGoenfWsEIvjeHOWvGEe6nsGALW/yfD2pmKc6A7oPQUB8hqunH3/OmSZ8YryVPgc
 Kr0vllqySu4Qw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2604D609F2;
 Fri,  5 Feb 2021 18:12:57 +0000 (UTC)
Subject: Re: [GIT PULL] vdpa: last minute bugfix
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210205104520-mutt-send-email-mst@kernel.org>
References: <20210205104520-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <netdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210205104520-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
X-PR-Tracked-Commit-Id: b35ccebe3ef76168aa2edaa35809c0232cb3578e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e07ce64d83046178c9c0c35e9d230a9b178b62ef
Message-Id: <161254877710.14736.823422420550424616.pr-tracker-bot@kernel.org>
Date: Fri, 05 Feb 2021 18:12:57 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 elic@nvidia.com, Linus Torvalds <torvalds@linux-foundation.org>
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

The pull request you sent on Fri, 5 Feb 2021 10:45:20 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e07ce64d83046178c9c0c35e9d230a9b178b62ef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
