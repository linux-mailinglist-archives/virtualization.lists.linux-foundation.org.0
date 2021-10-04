Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A19420656
	for <lists.virtualization@lfdr.de>; Mon,  4 Oct 2021 09:01:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C44F4405E9;
	Mon,  4 Oct 2021 07:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpYEt78-m3T7; Mon,  4 Oct 2021 07:01:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6A9AA4013F;
	Mon,  4 Oct 2021 07:01:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0856AC0022;
	Mon,  4 Oct 2021 07:01:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2442C000D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Oct 2021 07:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B55804013F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Oct 2021 07:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VdlHL0HtMn4o
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Oct 2021 07:01:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DA1E400BA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Oct 2021 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633330912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/XfU4rWvDAgggUknehKIH8tN+C4S9auUfbUS+SGc1Y=;
 b=K/fDmMqDuqVpMEXPlCQ7atOmlpdmi+hsMXTS67OdBQowpfI/bfbu8ezJ3WCKq0Q9My7NZw
 Ke9wIPi3JdQRyOaSMlzLOTM7jILTt94x4rfZID6Nd4yztXSR/qsbjVmEuVgbPE0inj1aD4
 F2O2+ogeElYsR2Ztjxf09fsXNsfJ5X4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-HVuoH5hPNc2doNzFCNwWqQ-1; Mon, 04 Oct 2021 03:01:51 -0400
X-MC-Unique: HVuoH5hPNc2doNzFCNwWqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB74B91274;
 Mon,  4 Oct 2021 07:01:48 +0000 (UTC)
Received: from localhost (unknown [10.39.193.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D20AF51DFA;
 Mon,  4 Oct 2021 07:01:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
In-Reply-To: <20211002082128-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <87r1d64dl4.fsf@redhat.com> <20210930130350.0cdc7c65.pasic@linux.ibm.com>
 <87ilyi47wn.fsf@redhat.com> <20211001162213.18d7375e.pasic@linux.ibm.com>
 <87v92g3h9l.fsf@redhat.com>
 <20211002082128-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 04 Oct 2021 09:01:42 +0200
Message-ID: <87pmsl2rzd.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Xie Yongji <xieyongji@bytedance.com>
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

On Sat, Oct 02 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Oct 01, 2021 at 05:18:46PM +0200, Cornelia Huck wrote:
>> I'd say we need a hack here so that we assume little-endian config space
>> if VERSION_1 has been offered; if your patch here works, I assume QEMU
>> does what we expect (assmuming little-endian as well.) I'm mostly
>> wondering what happens if you use a different VMM; can we expect it to
>> work similar to QEMU?
>
> Hard to say of course ... hopefully other VMMs are actually
> implementing the spec. E.g. IIUC rust vmm is modern only.

Yes, I kind of hope they are simply doing LE config space accesses.

Are there any other VMMs that are actually supported on s390x (or other
BE architectures)?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
