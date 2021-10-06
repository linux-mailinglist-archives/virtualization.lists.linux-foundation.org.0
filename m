Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0991B423D58
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 13:54:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BAA083A96;
	Wed,  6 Oct 2021 11:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f33L4ZFybHsm; Wed,  6 Oct 2021 11:54:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4C3C383AD8;
	Wed,  6 Oct 2021 11:54:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBDCBC000D;
	Wed,  6 Oct 2021 11:54:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2131EC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 11:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EC30607D0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 11:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kedsuY2mFaya
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 11:54:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE18D607AE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633521260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z3n781SEL+Kn3UomjzzL/ye4PJxJ0/lysVbmtVZ+Dws=;
 b=jCD288rln4edAhafZu9BRBpCS2l/xYABsvLrJ0nQZmSDVO+4+N4jjTWbmm0dqb1LefohGC
 2zAXpORz8gv+TZuigiSjhkBKOeciiARGGB2k+hGYLL/6DawFm7N++ePPXWqCm207PtD7Q0
 BO5jzySCdumBvCqz6QPP763jpq3qZNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-aEExm3fYO5iHeDGh_1t3yw-1; Wed, 06 Oct 2021 07:54:19 -0400
X-MC-Unique: aEExm3fYO5iHeDGh_1t3yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B952BBEE5;
 Wed,  6 Oct 2021 11:54:18 +0000 (UTC)
Received: from localhost (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FCE60BE5;
 Wed,  6 Oct 2021 11:54:03 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Enrico Granata <egranata@google.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-dev] Fwd: [PATCH v2] Provide detailed specification of
 virtio-blk lifetime metrics
In-Reply-To: <CAPR809uuo=5kmzUs3RFp6z_4===R0hxdFiScLPouUS+qxdaVWg@mail.gmail.com>
Organization: Red Hat GmbH
References: <20210505193655.2414268-1-egranata@google.com>
 <CAPR809ukYeThsPy4eg8A-G8b4Hwt7Prxh9P75=Vp9jnCKb6WqQ@mail.gmail.com>
 <YO6ro345FI0XE8vv@stefanha-x1.localdomain> <87pmvlck3p.fsf@redhat.com>
 <YO7zwKbH6OEW2z1o@stefanha-x1.localdomain>
 <CAPR809uuo=5kmzUs3RFp6z_4===R0hxdFiScLPouUS+qxdaVWg@mail.gmail.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 06 Oct 2021 13:54:01 +0200
Message-ID: <87h7duz7vq.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-block@vger.kernel.org, virtio-dev@lists.oasis-open.org,
 hch@infradead.org, virtualization@lists.linux-foundation.org
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

On Fri, Aug 06 2021, Enrico Granata <egranata@google.com> wrote:

> Hi folks,
> I am back from my leave of absence, so thank you everyone for your patience
>
> This proposal has been outstanding for a while and didn't seem to
> receive pushback, especially compared to the initial proposal
>
> Would it be the right time to put this modification up for a vote?

I guess no news is good news? (Or it fell through the cracks for everybody...)

I can update #106 and start voting.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
