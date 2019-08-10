Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D20889DB
	for <lists.virtualization@lfdr.de>; Sat, 10 Aug 2019 10:15:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B8FFA95;
	Sat, 10 Aug 2019 08:15:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 065B59EE
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 08:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E3A636D6
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l/8ZpdSjNJGlaMRnpgRX93SKgxcJOiB3tmAP4Xrhmq8=;
	b=gwp4ceQoYX55nhYbf83A4kSEa
	aYGw/CmaBlPTk+bOPXYYuEsc3k7qy+jtCjB3ITwKDgZlaXjzhPxMZJQUDTBGzZjvUckXfTn4UtQTV
	xLXADSc9dfUPJvZeXAiX+W1dlrb40e496u+BcCoRon5bxaDSOD3wAYQYqwNUUVb5r8ZG+yXqKHpA1
	Xwp4T///NUInyMPkgCBRYjcvI5OLDYCBGHP9jj0HMgkxqtX9h8ZH8nwvvChqQ06Ks8rFCrJFYnW88
	xqMPStWVoKzp/AJUDXTz61Nl0xufX4u2Vk5boeHYowDlusWWlTUprAJ09GTPQCGlorJXRbf+cKwRy
	zuFu6rLPQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hwMXM-0000C3-Qu; Sat, 10 Aug 2019 08:15:40 +0000
Date: Sat, 10 Aug 2019 01:15:40 -0700
From: Christoph Hellwig <hch@infradead.org>
To: egranata@chromium.org
Subject: Re: [PATCH] vhost: do not reference a file that does not exist
Message-ID: <20190810081540.GA30426@infradead.org>
References: <20190808005255.106299-1-egranata@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808005255.106299-1-egranata@chromium.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: trivial@kernel.org, kvm@vger.kernel.org, mst@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, egranata@google.com
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

On Wed, Aug 07, 2019 at 05:52:55PM -0700, egranata@chromium.org wrote:
> From: Enrico Granata <egranata@google.com>
> 
> lguest was removed from the mainline kernel in late 2017.
> 
> Signed-off-by: Enrico Granata <egranata@google.com>

But this particular file even has an override in the script looking
for dead references, which together with the content of the overal
contents makes me thing the dangling reference is somewhat intentional.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
