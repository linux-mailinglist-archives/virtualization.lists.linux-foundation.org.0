Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E21AD4BF
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 05:14:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DEB0085F74;
	Fri, 17 Apr 2020 03:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3G9SJ1BLjn9; Fri, 17 Apr 2020 03:14:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CAE8886103;
	Fri, 17 Apr 2020 03:14:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5529C0172;
	Fri, 17 Apr 2020 03:14:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06C9BC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E579F8786C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKC-t1rOlDPq
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A639987541
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587093151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kod4sBVNZl13j111ZtiqdMeSXjTm/Tfeat7xy/R1z0=;
 b=UmkpulOEhPVyx1Nhm0K6LXPQr5R/7TvL960h1wlck/vdXIXgiokkHbrNSs5mvkpk+1LUhp
 9zSQKUjShkBE/FmNn/mg5pEHsdgoaa7+1O0qamfIA2KhxhE4v7q4UJcPPy3Iw0mG1IraWa
 tjcvTRemqXlhdCAnQiPHxf3Yd4UR2m4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587093279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kod4sBVNZl13j111ZtiqdMeSXjTm/Tfeat7xy/R1z0=;
 b=VueVeQ1rQRWiz8Ri8duDvkx1JFJCJQxx+LLn+IoBCQQbvthalyPF15PPkyMS2wMSx4P2IK
 MsVAYD9TxfPei/JtS1Fja82/okN7Rlck3BeA+LwR8sZziMHYxwkx5pX2yA+hJ5VJDJodfb
 ka7RMiN/6sPAzqrVqlpPI5vzdgxJjrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-IdiGn_JcMJi4EAOTBKuGeg-1; Thu, 16 Apr 2020 23:12:26 -0400
X-MC-Unique: IdiGn_JcMJi4EAOTBKuGeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D22E8017F3;
 Fri, 17 Apr 2020 03:12:24 +0000 (UTC)
Received: from [10.72.13.254] (ovpn-13-254.pek2.redhat.com [10.72.13.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F061027BD7;
 Fri, 17 Apr 2020 03:12:15 +0000 (UTC)
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
Date: Fri, 17 Apr 2020 11:12:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200416185426-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: linux-s390@vger.kernel.org, tsbogend@alpha.franken.de,
 benh@kernel.crashing.org, gor@linux.ibm.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, heiko.carstens@de.ibm.com,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 borntraeger@de.ibm.com, geert@linux-m68k.org,
 Michael Ellerman <mpe@ellerman.id.au>, netdev@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8xNyDkuIrljYg2OjU1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBBcHIgMTUsIDIwMjAgYXQgMTA6NDM6NTZBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gV2UgdHJ5IHRvIGtlZXAgdGhlIGRlZmNvbmZpZyB1bnRvdWNoZWQgYWZ0ZXIgZGVjb3VwbGlu
ZyBDT05GSUdfVkhPU1QKPj4gb3V0IG9mIENPTkZJR19WSVJUVUFMSVpBVElPTiBpbiBjb21taXQg
MjBjMzg0ZjFlYTFhCj4+ICgidmhvc3Q6IHJlZmluZSB2aG9zdCBhbmQgdnJpbmdoIGtjb25maWci
KSBieSBlbmFibGluZyBWSE9TVF9NRU5VIGJ5Cj4+IGRlZmF1bHQuIFRoZW4gdGhlIGRlZmNvbmZp
Z3MgY2FuIGtlZXAgZW5hYmxpbmcgQ09ORklHX1ZIT1NUX05FVAo+PiB3aXRob3V0IHRoZSBjYXJp
bmcgb2YgQ09ORklHX1ZIT1NULgo+Pgo+PiBCdXQgdGhpcyB3aWxsIGxlYXZlIGEgIkNPTkZJR19W
SE9TVF9NRU5VPXkiIGluIGFsbCBkZWZjb25maWdzIGFuZCBldmVuCj4+IGZvciB0aGUgb25lcyB0
aGF0IGRvZXNuJ3Qgd2FudCB2aG9zdC4gU28gaXQgYWN0dWFsbHkgc2hpZnRzIHRoZQo+PiBidXJk
ZW5zIHRvIHRoZSBtYWludGFpbmVycyBvZiBhbGwgb3RoZXIgdG8gYWRkICJDT05GSUdfVkhPU1Rf
TUVOVSBpcwo+PiBub3Qgc2V0Ii4gU28gdGhpcyBwYXRjaCB0cmllcyB0byBlbmFibGUgQ09ORklH
X1ZIT1NUIGV4cGxpY2l0bHkgaW4KPj4gZGVmY29uZmlncyB0aGF0IGVuYWJsZXMgQ09ORklHX1ZI
T1NUX05FVCBhbmQgQ09ORklHX1ZIT1NUX1ZTT0NLLgo+Pgo+PiBBY2tlZC1ieTogQ2hyaXN0aWFu
IEJvcm50cmFlZ2VyPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+ICAoczM5MCkKPj4gQWNrZWQtYnk6
IE1pY2hhZWwgRWxsZXJtYW48bXBlQGVsbGVybWFuLmlkLmF1PiAgKHBvd2VycGMpCj4+IENjOiBU
aG9tYXMgQm9nZW5kb2VyZmVyPHRzYm9nZW5kQGFscGhhLmZyYW5rZW4uZGU+Cj4+IENjOiBCZW5q
YW1pbiBIZXJyZW5zY2htaWR0PGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPj4gQ2M6IFBhdWwg
TWFja2VycmFzPHBhdWx1c0BzYW1iYS5vcmc+Cj4+IENjOiBNaWNoYWVsIEVsbGVybWFuPG1wZUBl
bGxlcm1hbi5pZC5hdT4KPj4gQ2M6IEhlaWtvIENhcnN0ZW5zPGhlaWtvLmNhcnN0ZW5zQGRlLmli
bS5jb20+Cj4+IENjOiBWYXNpbHkgR29yYmlrPGdvckBsaW51eC5pYm0uY29tPgo+PiBDYzogQ2hy
aXN0aWFuIEJvcm50cmFlZ2VyPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+Cj4+IFJlcG9ydGVkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW48Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiBJIHJlYmFzZWQgdGhpcyBvbiB0
b3Agb2YgT0FCSSBmaXggc2luY2UgdGhhdAo+IHNlZW1zIG1vcmUgb3JnZW50IHRvIGZpeC4KPiBQ
dXNoZWQgdG8gbXkgdmhvc3QgYnJhbmNoIHBscyB0YWtlIGEgbG9vayBhbmQKPiBpZiBwb3NzaWJs
ZSB0ZXN0Lgo+IFRoYW5rcyEKCgpJIHRlc3QgdGhpcyBwYXRjaCBieSBnZW5lcmF0aW5nIHRoZSBk
ZWZjb25maWdzIHRoYXQgd2FudHMgdmhvc3RfbmV0IG9yIAp2aG9zdF92c29jay4gQWxsIGxvb2tz
IGZpbmUuCgpCdXQgaGF2aW5nIENPTkZJR19WSE9TVF9EUE49eSBtYXkgZW5kIHVwIHdpdGggdGhl
IHNpbWlsYXIgc2l0dWF0aW9uIHRoYXQgCnRoaXMgcGF0Y2ggd2FudCB0byBhZGRyZXNzLgoKTWF5
YmUgd2UgY2FuIGxldCBDT05GSUdfVkhPU1QgZGVwZW5kcyBvbiAhQVJNIHx8IEFFQUJJIHRoZW4g
YWRkIGFub3RoZXIgCm1lbnVjb25maWcgZm9yIFZIT1NUX1JJTkcgYW5kIGRvIHNvbWV0aGluZyBz
aW1pbGFyPwoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
