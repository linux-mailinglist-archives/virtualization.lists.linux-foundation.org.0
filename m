Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 439ED86210
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 14:42:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 482F91005;
	Thu,  8 Aug 2019 12:42:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3B51BFF0
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 12:42:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E605714D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 12:42:34 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 38D102171F;
	Thu,  8 Aug 2019 12:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565268154;
	bh=H3Xm8TVT+2ZXNimGkZTlU8kaRfKXyQSpxg1WVh70iLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJa/AClplyDnhtCu5fn8WkR83+bJajnIKx+Y4J/LT90BwsHTPtDpOtcgvGdDDQlbd
	IRrhenCSxisAAJhQynis+WiF7IQpOcrPUH0La7Cj68dREP9+aJBzFgC77voWxfueNH
	jSfQXHMTJZxEwws2i/ZtP+jMwgtRbtPCP0JEjFdY=
Date: Thu, 8 Aug 2019 14:42:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH v2 2/2] virtio_ring: packed ring: fix
	virtqueue_detach_unused_buf
Message-ID: <20190808124232.GA32144@kroah.com>
References: <20190808113606.19504-1-pagupta@redhat.com>
	<20190808113606.19504-3-pagupta@redhat.com>
	<20190808115630.GB2015@kroah.com>
	<1512438873.7425183.1565267326035.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1512438873.7425183.1565267326035.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: arnd@arndb.de, mst@redhat.com, amit@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Thu, Aug 08, 2019 at 08:28:46AM -0400, Pankaj Gupta wrote:
> 
> 
> > > This patch makes packed ring code compatible with split ring in function
> > > 'virtqueue_detach_unused_buf_*'.
> > 
> > What does that mean?  What does this "fix"?
> 
> Patch 1 frees the buffers When a port is unplugged from the virtio
> console device. It does this with the help of 'virtqueue_detach_unused_buf_split/packed'
> function. For split ring case, corresponding function decrements avail ring index.
> For packed ring code, this functionality is not available, so this patch adds the
> required support and hence help to remove the unused buffer completely.

Explain all of this in great detail in the changelog comment.  What you
have in there today does not make any sense.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
