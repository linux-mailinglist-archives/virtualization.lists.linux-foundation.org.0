Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD232952B
	for <lists.virtualization@lfdr.de>; Fri, 24 May 2019 11:54:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A70CF14;
	Fri, 24 May 2019 09:54:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ADC93C03
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 09:54:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 133B5F4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 09:54:38 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <johannes@sipsolutions.net>)
	id 1hU6uB-0001Nq-RL; Fri, 24 May 2019 11:54:27 +0200
Message-ID: <aa9490ff07c587b3bca01ec5eb33d59ea440b645.camel@sipsolutions.net>
Subject: Re: [Qemu-devel] custom virt-io support (in user-mode-linux)
From: Johannes Berg <johannes@sipsolutions.net>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 24 May 2019 11:54:26 +0200
In-Reply-To: <CAJSP0QWSZXT3OJAc=abagD40xZ7DWWrcP_+AwVBuqQyQNgaOEg@mail.gmail.com>
	(sfid-20190523_164131_760945_C45BA0A2)
References: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
	<20190523115950.GH26632@stefanha-x1.localdomain>
	<41d64b8971a097d1568f947517b45d09c156ccc8.camel@sipsolutions.net>
	<CAJSP0QWSZXT3OJAc=abagD40xZ7DWWrcP_+AwVBuqQyQNgaOEg@mail.gmail.com>
	(sfid-20190523_164131_760945_C45BA0A2)
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: ido@wizery.com, linux-um@lists.infradead.org,
	qemu-devel <qemu-devel@nongnu.org>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>
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

On Thu, 2019-05-23 at 15:41 +0100, Stefan Hajnoczi wrote:

> > Also, not sure I understand how the client is started?
> 
> The vhost-user device backend can be launched before QEMU.  QEMU is
> started with the UNIX domain socket path so it can connect.

Hmm. I guess I'm confusing the terminology then - I thought qemu was the
server and the backend was the client that connects to it. If it's the
other way around, yeah, that makes things easier and certainly makes
sense (you could have a daemon that implements something).

> QEMU itself doesn't fork+exec the vhost-user device backend.  It's
> expected that the user or the management stack has already launched
> the vhost-user device backend.

Right.

> > Do you know if there's a sample client/server somewhere?
> 
> See contrib/libvhost-user in the QEMU source tree as well as the
> vhost-user-blk and vhost-user-scsi examples in the contrib/ directory.

Awesome, thanks!

johannes

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
