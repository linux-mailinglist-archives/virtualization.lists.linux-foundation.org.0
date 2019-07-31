Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 835047BC33
	for <lists.virtualization@lfdr.de>; Wed, 31 Jul 2019 10:49:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1192A3B32;
	Wed, 31 Jul 2019 08:49:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 03FDC3AA4
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 08:38:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9FEF2832
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 08:38:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD99FC007359;
	Wed, 31 Jul 2019 08:38:00 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30EE16012E;
	Wed, 31 Jul 2019 08:37:54 +0000 (UTC)
Date: Wed, 31 Jul 2019 10:37:51 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 12/29] compat_ioctl: move drivers to compat_ptr_ioctl
Message-ID: <20190731103751.3cc53132.cohuck@redhat.com>
In-Reply-To: <20190730195227.742215-1-arnd@arndb.de>
References: <20190730192552.4014288-1-arnd@arndb.de>
	<20190730195227.742215-1-arnd@arndb.de>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 31 Jul 2019 08:38:01 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: devel@driverdev.osuosl.org, kvm@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
	virtualization@lists.linux-foundation.org,
	linux-integrity@vger.kernel.org, netdev@vger.kernel.org,
	linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	linux-input@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Jiri Kosina <jkosina@suse.cz>, ceph-devel@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, Jason Gunthorpe <jgg@mellanox.com>,
	linux-arm-kernel@lists.infradead.org
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

On Tue, 30 Jul 2019 21:50:28 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> Each of these drivers has a copy of the same trivial helper function to
> convert the pointer argument and then call the native ioctl handler.
> 
> We now have a generic implementation of that, so use it.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
> Reviewed-by: Jiri Kosina <jkosina@suse.cz>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

>  drivers/vfio/vfio.c               | 39 +++----------------------------

vfio changes:

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
