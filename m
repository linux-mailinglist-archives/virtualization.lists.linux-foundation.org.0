Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 86025262DBF
	for <lists.virtualization@lfdr.de>; Wed,  9 Sep 2020 13:24:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0B84D8750B;
	Wed,  9 Sep 2020 11:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7q1EkP34B9yX; Wed,  9 Sep 2020 11:24:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E2B487509;
	Wed,  9 Sep 2020 11:24:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6020CC0051;
	Wed,  9 Sep 2020 11:24:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00CEAC0051
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 11:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E2C178750B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 11:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSKuK-9Q4njO
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 11:24:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1730787509
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 11:24:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmfmN3SGmz9sTd;
 Wed,  9 Sep 2020 21:24:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599650649;
 bh=McxY0vGyvNVlrIIx6KzYtU4PcHnFzd9G9dek0Ykf36c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SmXDZKzAAkIskfZPfi7qrbi2STOAaRgkLgLUwpRIri563PnPrs5blw/OlSwl2MX5i
 69HKj9JHLONl1Qz3CbYvZy/4cbddpiJHmROqXSbmg8WJh+BTuQXH9dKNRHILZpAo1t
 hze5cgR0ZcFpNy/5f5QSzsCR/ywLKY3MFV1MB2evwZ2HPd+YxWui6TnWbMXUjz3bFE
 Dflejkj7ciOj6dUGOWs0UizA/kfuOX43D8JH9M1T139ttlnt9G8+OPWPLzwt3iVOxx
 uuXIzjXH4T67FDy3bvc2QCqjoeC0dD5axnVjQL4imxfeD2KhwwbuLyb1WJFKSm2qYS
 /CHKbJLh3kYdA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] mm/memory_hotplug: prepare passing flags to
 add_memory() and friends
In-Reply-To: <3bc5b464-3229-d442-714a-ec33b5728ac6@redhat.com>
References: <20200908201012.44168-1-david@redhat.com>
 <20200908201012.44168-4-david@redhat.com> <20200909071759.GD435421@kroah.com>
 <3bc5b464-3229-d442-714a-ec33b5728ac6@redhat.com>
Date: Wed, 09 Sep 2020 21:24:02 +1000
Message-ID: <87eenbry5p.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Pingfan Liu <kernelfans@gmail.com>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vishal Verma <vishal.l.verma@intel.com>,
 linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org,
 Anton Blanchard <anton@ozlabs.org>, Heiko Carstens <hca@linux.ibm.com>,
 Len Brown <lenb@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Leonardo Bras <leobras.c@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Juergen Gross <jgross@suse.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Libor Pechacek <lpechacek@suse.cz>, linux-nvdimm@lists.01.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Wei Yang <richardw.yang@linux.intel.com>, Oliver O'Halloran <oohall@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
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

David Hildenbrand <david@redhat.com> writes:
> On 09.09.20 09:17, Greg Kroah-Hartman wrote:
>> On Tue, Sep 08, 2020 at 10:10:08PM +0200, David Hildenbrand wrote:
>>> We soon want to pass flags, e.g., to mark added System RAM resources.
>>> mergeable. Prepare for that.
>> 
>> What are these random "flags", and how do we know what should be passed
>> to them?
>> 
>> Why not make this an enumerated type so that we know it all works
>> properly, like the GPF_* flags are?  Passing around a random unsigned
>> long feels very odd/broken...
>
> Agreed, an enum (mhp_flags) seems to give a better hint what can
> actually be passed. Thanks!

You probably know this but ...

Just using a C enum doesn't get you any type safety.

You can get some checking via sparse by using __bitwise, which is what
gfp_t does. You don't actually have to use an enum for that, it works
with #defines also.

Or you can wrap the flag in a struct, the way atomic_t does, and then
the compiler will prevent passing plain integers in place of your custom
type.

cheers
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
