Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792C861A1
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 14:28:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7AF3A1017;
	Thu,  8 Aug 2019 12:28:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5324CCCC
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 12:28:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0711C14D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 12:28:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 896FC3007F39;
	Thu,  8 Aug 2019 12:28:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7975A19D70;
	Thu,  8 Aug 2019 12:28:46 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65D5418089C8;
	Thu,  8 Aug 2019 12:28:46 +0000 (UTC)
Date: Thu, 8 Aug 2019 08:28:46 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <1512438873.7425183.1565267326035.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190808115630.GB2015@kroah.com>
References: <20190808113606.19504-1-pagupta@redhat.com>
	<20190808113606.19504-3-pagupta@redhat.com>
	<20190808115630.GB2015@kroah.com>
Subject: Re: [PATCH v2 2/2] virtio_ring: packed ring: fix
	virtqueue_detach_unused_buf
MIME-Version: 1.0
X-Originating-IP: [10.67.116.132, 10.4.195.15]
Thread-Topic: virtio_ring: packed ring: fix virtqueue_detach_unused_buf
Thread-Index: 1dZf+nrJonjXypT43ZqdcgxKewv0gw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 08 Aug 2019 12:28:46 +0000 (UTC)
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



> > This patch makes packed ring code compatible with split ring in function
> > 'virtqueue_detach_unused_buf_*'.
> 
> What does that mean?  What does this "fix"?

Patch 1 frees the buffers When a port is unplugged from the virtio
console device. It does this with the help of 'virtqueue_detach_unused_buf_split/packed'
function. For split ring case, corresponding function decrements avail ring index.
For packed ring code, this functionality is not available, so this patch adds the
required support and hence help to remove the unused buffer completely.

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
