Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955C6C0F5
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 20:30:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 95040ECB;
	Wed, 17 Jul 2019 18:30:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 57E59FA2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 18:30:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5ED21756
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 18:30:04 +0000 (UTC)
Subject: Re: [PULL] virtio, vhost: fixes, features, performance
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563388203;
	bh=SsgEQ229BFDzVjWE4Rfd94cxbm2rr6++cJP0jupJNlI=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=1OMBw+NNcoYT1euAQa76cEb1EnJLTbURZO01B9VLtWDbz6o2ygQuSEU/k5bwly/JN
	I9WKTyRViJihLBuveQwr15VdePBK/oENdwCbcZIOCueP649B9L4SUwnKWdXebZmJ3r
	0AOCFDDnCBkwuFhQ3rgUh397M2+y0SfUzso6xWjs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190716113151-mutt-send-email-mst@kernel.org>
References: <20190716113151-mutt-send-email-mst@kernel.org>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190716113151-mutt-send-email-mst@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
	tags/for_linus
X-PR-Tracked-Commit-Id: 5e663f0410fa2f355042209154029842ba1abd43
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a1d5384b7decbff6519daa9c65a35665e227323
Message-Id: <156338820366.716.10416228849149522179.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jul 2019 18:30:03 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, gustavo@embeddedor.com,
	virtualization@lists.linux-foundation.org,
	James.Bottomley@hansenpartnership.com, linux-mm@kvack.org,
	aarcange@redhat.com, jean-philippe.brucker@arm.com,
	ihor.matushchak@foobox.net, mst@redhat.com, hch@infradead.org,
	eric.auger@redhat.com, jglisse@redhat.com, bhelgaas@google.com,
	natechancellor@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net
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

The pull request you sent on Tue, 16 Jul 2019 11:31:51 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a1d5384b7decbff6519daa9c65a35665e227323

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
