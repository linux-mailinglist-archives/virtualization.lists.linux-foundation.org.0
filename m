Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0786223
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 14:45:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1786FFB;
	Thu,  8 Aug 2019 12:44:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BAB90FF0
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 12:44:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A338875
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 12:44:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCF56316E536;
	Thu,  8 Aug 2019 12:44:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D27B55B69A;
	Thu,  8 Aug 2019 12:44:55 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B870024F30;
	Thu,  8 Aug 2019 12:44:55 +0000 (UTC)
Date: Thu, 8 Aug 2019 08:44:55 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <845593916.7427317.1565268295376.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190808124232.GA32144@kroah.com>
References: <20190808113606.19504-1-pagupta@redhat.com>
	<20190808113606.19504-3-pagupta@redhat.com>
	<20190808115630.GB2015@kroah.com>
	<1512438873.7425183.1565267326035.JavaMail.zimbra@redhat.com>
	<20190808124232.GA32144@kroah.com>
Subject: Re: [PATCH v2 2/2] virtio_ring: packed ring: fix
	virtqueue_detach_unused_buf
MIME-Version: 1.0
X-Originating-IP: [10.67.116.132, 10.4.195.2]
Thread-Topic: virtio_ring: packed ring: fix virtqueue_detach_unused_buf
Thread-Index: X9W6BkL4XixQLAtInU+7HudXiIE/mA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 08 Aug 2019 12:44:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
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


> On Thu, Aug 08, 2019 at 08:28:46AM -0400, Pankaj Gupta wrote:
> > 
> > 
> > > > This patch makes packed ring code compatible with split ring in
> > > > function
> > > > 'virtqueue_detach_unused_buf_*'.
> > > 
> > > What does that mean?  What does this "fix"?
> > 
> > Patch 1 frees the buffers When a port is unplugged from the virtio
> > console device. It does this with the help of
> > 'virtqueue_detach_unused_buf_split/packed'
> > function. For split ring case, corresponding function decrements avail ring
> > index.
> > For packed ring code, this functionality is not available, so this patch
> > adds the
> > required support and hence help to remove the unused buffer completely.
> 
> Explain all of this in great detail in the changelog comment.  What you
> have in there today does not make any sense.

Sure. Will try to put in more clear words.

Thanks,
Pankaj

> 
> thanks,
> 
> greg k-h
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
