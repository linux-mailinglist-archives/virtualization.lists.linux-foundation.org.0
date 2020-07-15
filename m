Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA52208FF
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:42:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6A3EE8915A;
	Wed, 15 Jul 2020 09:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQLaN_qBh5B2; Wed, 15 Jul 2020 09:42:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 022EC89161;
	Wed, 15 Jul 2020 09:42:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8336C0733;
	Wed, 15 Jul 2020 09:42:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74F86C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5FD288A9B0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTCknFM+SdMA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:42:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B1E0A8888E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594806169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVN0SUJiWNQOMGmLO1R6WOiZV8nRybRORnIp3pu3RNw=;
 b=KmSi0GUntHAji6qNUhz25b1hNpkBd9R6wd1Cbj2P0dDybv5EVcfQn+5YVVjHEfGB5KfUD7
 qnsRf9A0114NW70+WqCNbRIs2ahVg1CqU0c4QoJ2nzkQh8Ba6sUgL00JxDTX3duECO3rJD
 LEi11yfGUay3ml6UcIyBWOefp5OUHaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-JARX-4MgPmqeCi7a5jNSaA-1; Wed, 15 Jul 2020 05:42:44 -0400
X-MC-Unique: JARX-4MgPmqeCi7a5jNSaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE7201800D42;
 Wed, 15 Jul 2020 09:42:42 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3395310013D0;
 Wed, 15 Jul 2020 09:42:34 +0000 (UTC)
Subject: Re: [PATCH 3/7] vhost_vdpa: implement IRQ offloading functions in
 vhost_vdpa
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594565366-3195-1-git-send-email-lingshan.zhu@intel.com>
 <1594565366-3195-3-git-send-email-lingshan.zhu@intel.com>
 <3fb9ecfc-a325-69b5-f5b7-476a5683a324@redhat.com>
 <e06f9706-441f-0d7a-c8c0-cd43a26c5296@intel.com>
 <f352a1d1-6732-3237-c85e-ffca085195ff@redhat.com>
 <8f52ee3a-7a08-db14-9194-8085432481a4@intel.com>
 <2bd946e3-1524-efa5-df2b-3f6da66d2069@redhat.com>
 <61c1753a-43dc-e448-6ece-13a19058e621@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c9f2ffb0-adc0-8846-9578-1f75a4374df1@redhat.com>
Date: Wed, 15 Jul 2020 17:42:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61c1753a-43dc-e448-6ece-13a19058e621@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNy8xNSDkuIvljYg1OjIwLCBaaHUsIExpbmdzaGFuIHdyb3RlOgo+Pj4+Cj4+Pj4g
SSBtZWFudCBzb21ldGhpbmcgbGlrZToKPj4+Pgo+Pj4+IHVucmVnaXN0ZXIoKTsKPj4+PiB2cS0+
Y2FsbF9jdHgucHJvZHVjZXIudG9rZW4gPSBjdHg7Cj4+Pj4gcmVnaXN0ZXIoKTsKPj4+IFRoaXMg
aXMgd2hhdCB3ZSBhcmUgZG9pbmcgbm93LCBvciBJIG11c3QgbWlzc2VkIHNvbWV0aGlnOgo+Pj4g
aWYgKGN0eCAmJiBjdHggIT0gdG9rZW4pIHsKPj4+IMKgwqDCoMKgaXJxX2J5cGFzc191bnJlZ2lz
dGVyX3Byb2R1Y2VyKCZ2cS0+Y2FsbF9jdHgucHJvZHVjZXIpOwo+Pj4gwqDCoMKgwqB2cS0+Y2Fs
bF9jdHgucHJvZHVjZXIudG9rZW4gPSBjdHg7Cj4+PiDCoMKgwqDCoGlycV9ieXBhc3NfcmVnaXN0
ZXJfcHJvZHVjZXIoJnZxLT5jYWxsX2N0eC5wcm9kdWNlcik7Cj4+Pgo+Pj4gfQo+Pj4KPj4+IEl0
IGp1c3QgdW5yZWdpc3RlciBhbmQgcmVnaXN0ZXIuCj4+Cj4+Cj4+IEkgbWVhbnQgdGhlcmUncyBw
cm9iYWJseSBubyBuZWVkIGZvciB0aGUgY2hlY2sgYW5kIGFub3RoZXIgY2hlY2sgYW5kIAo+PiB1
bnJlZ2lzdGVyIGJlZm9yZS4gVGhlIHdob2xlIGZ1bmN0aW9uIGlzIGFzIHNpbXBsZSBhcyBJIHN1
Z2dlc3RlZCBhYm92ZS4KPj4KPj4gVGhhbmtzCj4gSU1ITyB3ZSBzdGlsbCBuZWVkIHRoZSBjaGVj
a3MsIHRoaXMgZnVuY3Rpb24gaGFuZGxlcyB0aHJlZSBjYXNlczoKPiAoMSlpZiB0aGUgY3R4ID09
IHRva2VuLCB3ZSBkbyBub3RoaW5nLiBGb3IgdGhpcyB1bnJlZ2lzdGVyIGFuZCByZWdpc3RlciBj
YW4gd29yaywgYnV0IHdhc3RlIG9mIHRpbWUuCgoKQnV0IHdlIGhhdmUgYSBtb3JlIHNpbXBsZSBj
b2RlIGFuZCB3ZSBkb24ndCBjYXJlIGFib3V0IHRoZSBwZXJmb3JtYW5jZSAKaGVyZSBzaW5jZSB0
aGUgb3BlcmF0aW9ucyBpcyByYXJlLgoKCj4gKDIpaWYgdG9rZW4gZXhpc3RzIGJ1dCBjdHggaXMg
TlVMTCwgdGhpcyBtZWFucyB1c2VyIHNwYWNlIGlzc3VlZCBhbiB1bmJpbmQsIHNvIHdlIG5lZWQg
dG8gb25seSB1bnJlZ2lzdGVyIHRoZSBwcm9kdWNlci4KCgpOb3RlIHRoYXQgdGhlIHJlZ2lzdGVy
L3VucmVnaXN0ZXIgaGF2ZSBhIGdyYWNlZnVsIGNoZWNrIG9mIHdoZXRoZXIgb3IgCm5vdCB0aGVy
ZSdzIGEgdG9rZW4uCgoKPiAoMylpZiBjdHggZXhpc3RzIGFuZCBjdHghPXRva2VuLCB0aGlzIG1l
YW5zIHRoZXJlIGlzIGEgbmV3IGN0eCwgd2UgbmVlZCB0byB1cGRhdGUgcHJvZHVjZXIgYnkgdW5y
ZWdpc3RlciBhbmQgcmVnaXN0ZXIuCj4KPiBJIHRoaW5rIHdlIGNhbiBub3Qgc2ltcGx5IGhhbmRs
ZSBhbGwgdGhlc2UgY2FzZXMgYnkgInVucmVnaXN0ZXIgYW5kIHJlZ2lzdGVyIi4KCgpTbyBpdCBs
b29rcyB0byBtZSB0aGUgZnVuY3Rpb25zIGFyZSBlcXVpdmFsZW50LgoKVGhhbmtzCgoKPgo+IFRo
YW5rcywKPiBCUgo+IFpodSBMaW5nc2hhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
