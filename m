Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BB340F3AF
	for <lists.virtualization@lfdr.de>; Fri, 17 Sep 2021 10:02:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A87A415F1;
	Fri, 17 Sep 2021 08:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ed89LqDRMXEx; Fri, 17 Sep 2021 08:02:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 139DE415F4;
	Fri, 17 Sep 2021 08:02:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1ABAC000D;
	Fri, 17 Sep 2021 08:02:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08362C000D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 08:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC8C7415F4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 08:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kec2dnq6-cY
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 08:02:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55C87415F1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YK8khSyl2xX+jHd+eUzLYa7jXWZ6y9Xvg5caCBnq2nY=; b=TZNzPq5Lbhh3Y1pWBZ6aBq6u80
 2HidQwWgaSKaFdyLuyGpnkwWreG9bDozfD3PbAZLj5Hy0ggEUcTgF8I6hcpOktWZV7tiCTHCutJoX
 8vVStd5XpR0V+rCk99mwcmxJSY2ToposiiIZNY+aMhJv7GJ+G8mKdTnptbD5jhpNMnJ6adShTCuba
 ASJCtaAKLzTuKPzxYlGbFzYihkt7MCunyuysjFPYeBnwobA8oVSwueyxvhVaW564Gjo6OSM3nLTWh
 SfQewKAKwI6T3QsruYKBEvX9gb5JopexkJrDd21D8IFZC5E8G22nsqFaMKOnCEzWKEhAhfazRTQ7x
 W+/s2d0A==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mR8ny-0002gf-Dm; Fri, 17 Sep 2021 08:01:18 +0000
Date: Fri, 17 Sep 2021 09:01:06 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 1/8] fork: add helper to clone a process
Message-ID: <YURLQvJAO2mCX0zJ@infradead.org>
References: <20210916212051.6918-1-michael.christie@oracle.com>
 <20210916212051.6918-2-michael.christie@oracle.com>
 <YUQvAy8HDh5oYyqn@infradead.org>
 <20210917074440.qwo6anrtxa7lj657@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210917074440.qwo6anrtxa7lj657@wittgenstein>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, stefanha@redhat.com
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

On Fri, Sep 17, 2021 at 09:44:40AM +0200, Christian Brauner wrote:
> > generally want a printf-like varargs caling conventions.  I'd also
> > much prefer to hide as much as possible in the actual helper.  That is
> > build a helper that gets the name, a flag to ignore the singals etc
> > instead of exporting all these random low-level helpers.
> 
> Yes, I think that's really what we want here.

In a way this would mean enhancing the kthread API to also support I/O
threads.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
