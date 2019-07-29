Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E03B79353
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 20:45:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 420531D03;
	Mon, 29 Jul 2019 18:45:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C04021CEC
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 18:40:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BF1C82C6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 18:40:18 +0000 (UTC)
Subject: Re: [PULL] vhost,virtio: cleanups and fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564425618;
	bh=pOrk3tU71dZX+Rcd0VhYhQmj36JdpwLj+USN8H0R2RQ=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=iS/iiZeCxsWwHuTw4DA+P/VSujfoGU7q3H2maGCYU4rW0DUUmdvtoIqgX+ezb2yjS
	t+d/qQh1X/esvCv/CpXu8K3On1g0lf5/nLj7/sviPpMhsC7VU6YdTdF6oKOOTrzCv2
	b8NkV0O/NqpG/r9gTGfYVTuCiBivyIzHPdMXkNms=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190729121605-mutt-send-email-mst@kernel.org>
References: <20190729121605-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190729121605-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
	tags/for_linus
X-PR-Tracked-Commit-Id: 73f628ec9e6bcc45b77c53fe6d0c0ec55eaf82af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a11c76e5301dddefcb618dac04f74e6314df6bc
Message-Id: <156442561858.16864.7993993619692997992.pr-tracker-bot@kernel.org>
Date: Mon, 29 Jul 2019 18:40:18 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jean-philippe@linaro.org, jroedel@suse.de, kvm@vger.kernel.org,
	mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, eric.auger@redhat.com,
	namit@vmware.com, Linus Torvalds <torvalds@linux-foundation.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The pull request you sent on Mon, 29 Jul 2019 12:16:05 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a11c76e5301dddefcb618dac04f74e6314df6bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
