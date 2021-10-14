Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BED42DE43
	for <lists.virtualization@lfdr.de>; Thu, 14 Oct 2021 17:37:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B3E680E9B;
	Thu, 14 Oct 2021 15:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FiUMZv9c5C61; Thu, 14 Oct 2021 15:37:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 125A98289B;
	Thu, 14 Oct 2021 15:37:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 879E6C000D;
	Thu, 14 Oct 2021 15:37:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3303C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 15:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8786402A8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 15:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCPd9RSVWw1B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 15:37:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD09E400DF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 15:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634225854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ghrZ0fHY/L2lVDm2zxtj2ajOfOrWxMBCP6nrtoJMjlE=;
 b=G8dw64QNQ5zXLJ+j5G7dj9It1kJw2ENLA3Bg2XfU38lCpK366L4lq8ok8xYU2lziUa9wf5
 EAF+gmNytIEe+th8yf5g3HJe8WsfaKmr9zwoUaEQdEHQpMN4bNSdM8ZJ1cEzKbW5LZ4LeZ
 qtFcnnHkUXeObF0PlORFf/7aoPdj0is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-XBNGnKW5O1elDhXz9B8b8Q-1; Thu, 14 Oct 2021 11:37:29 -0400
X-MC-Unique: XBNGnKW5O1elDhXz9B8b8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B6CC814250;
 Thu, 14 Oct 2021 15:37:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A00360583;
 Thu, 14 Oct 2021 15:37:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Enrico Granata <egranata@google.com>
Subject: Re: [virtio-dev] Fwd: [PATCH v2] Provide detailed specification of
 virtio-blk lifetime metrics
In-Reply-To: <CAPR809vsz_z4ooL6dPJMDtTWtf02-jbz4FVipRjsLGczCV_XCQ@mail.gmail.com>
Organization: Red Hat GmbH
References: <20210505193655.2414268-1-egranata@google.com>
 <CAPR809ukYeThsPy4eg8A-G8b4Hwt7Prxh9P75=Vp9jnCKb6WqQ@mail.gmail.com>
 <YO6ro345FI0XE8vv@stefanha-x1.localdomain> <87pmvlck3p.fsf@redhat.com>
 <YO7zwKbH6OEW2z1o@stefanha-x1.localdomain>
 <CAPR809uuo=5kmzUs3RFp6z_4===R0hxdFiScLPouUS+qxdaVWg@mail.gmail.com>
 <87h7duz7vq.fsf@redhat.com>
 <CAPR809vsz_z4ooL6dPJMDtTWtf02-jbz4FVipRjsLGczCV_XCQ@mail.gmail.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 14 Oct 2021 17:37:18 +0200
Message-ID: <87ilxzvcr5.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: linux-block@vger.kernel.org, virtio-dev@lists.oasis-open.org,
 hch@infradead.org, Stefan Hajnoczi <stefanha@redhat.com>,
 virtualization@lists.linux-foundation.org
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

On Wed, Oct 06 2021, Enrico Granata <egranata@google.com> wrote:

> I would very much favor that - thanks for bringing this thread back to attention

Merged now, thank you for your patience.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
