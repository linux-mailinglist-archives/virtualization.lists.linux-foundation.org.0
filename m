Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A782CC8C15
	for <lists.virtualization@lfdr.de>; Wed,  2 Oct 2019 16:53:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2003EF25;
	Wed,  2 Oct 2019 14:53:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 212E0F1E
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 14:52:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D1F268C8
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 14:52:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47FE28980E1;
	Wed,  2 Oct 2019 14:52:57 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B72EF608A5;
	Wed,  2 Oct 2019 14:52:53 +0000 (UTC)
Date: Wed, 2 Oct 2019 15:52:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: virtq questions
Message-ID: <20191002145251.GD2710@work-vm>
References: <CAJfpegsGNoT4NUai-=HHkqOrmjgMb=4TDk79EgxDBCd8fxCGZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJfpegsGNoT4NUai-=HHkqOrmjgMb=4TDk79EgxDBCd8fxCGZA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Wed, 02 Oct 2019 14:52:57 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	virtualization@lists.linux-foundation.org
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

* Miklos Szeredi (miklos@szeredi.hu) wrote:
> Looking at the ugly retry logic in virtiofs and have some questions.
> First one is, where do these features come from:
> 
> VIRTIO_F_RING_PACKED
> VIRTIO_RING_F_INDIRECT_DESC
> 
> I see that in virtiofs "packed" is off and "indirect" is on.  Is this
> guaranteed?

I think the xdindirect is coming from qemu's hw/virtio/virtio.h DEFINE_VIRTIO_COMMON_FEATURES
which has:
    DEFINE_PROP_BIT64("indirect_desc", _state, _field,    \
                      VIRTIO_RING_F_INDIRECT_DESC, true), \

Dave

> Thanks,
> Miklos
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
