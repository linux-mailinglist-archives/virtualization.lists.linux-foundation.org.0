Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D60AB191F98
	for <lists.virtualization@lfdr.de>; Wed, 25 Mar 2020 04:14:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6152486A3C;
	Wed, 25 Mar 2020 03:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l+930k0QLqoK; Wed, 25 Mar 2020 03:14:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 33F3486B90;
	Wed, 25 Mar 2020 03:14:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29065C0177;
	Wed, 25 Mar 2020 03:14:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 083ACC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 03:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E6B3923504
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 03:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQbZy8adEo3m
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 03:14:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by silver.osuosl.org (Postfix) with ESMTPS id A967D23491
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 03:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585106056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tlnvEiI040ACQ537mohs9KaGt5WE1E8quEggSdqcSkQ=;
 b=Jhu9+1uZCzf/liDK9H9HNbPDez2Xnr5Qdp1riwSk+3twdIJ8Qymsn46LTZ6wzaQ/tHOmzD
 aTnrmpQ/iQ+NAGq69MU92q7uzs5LbOIDALNOZZqTJfR8cOqvHSaVHxK+u+XaYZnklEsqU3
 zCR66WIzhwwMzcLx/cdPwVGX6AUF+jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-arsdJjnLP0upUxzGWPsajQ-1; Tue, 24 Mar 2020 23:14:02 -0400
X-MC-Unique: arsdJjnLP0upUxzGWPsajQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 509FE100550D;
 Wed, 25 Mar 2020 03:14:01 +0000 (UTC)
Received: from [10.72.12.54] (ovpn-12-54.pek2.redhat.com [10.72.12.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44E028AC30;
 Wed, 25 Mar 2020 03:13:55 +0000 (UTC)
Subject: Re: [PATCH V7 3/8] vringh: IOTLB support
To: kbuild test robot <lkp@intel.com>
References: <20200324041458.27384-4-jasowang@redhat.com>
 <202003250217.stptJTnJ%lkp@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4032c9a2-a6c1-a041-fd59-81a8bf2fca46@redhat.com>
Date: Wed, 25 Mar 2020 11:13:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <202003250217.stptJTnJ%lkp@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: kbuild-all@lists.01.org, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

Ck9uIDIwMjAvMy8yNSDkuIrljYgyOjE5LCBrYnVpbGQgdGVzdCByb2JvdCB3cm90ZToKPiBIaSBK
YXNvbiwKPgo+IEkgbG92ZSB5b3VyIHBhdGNoISBZZXQgc29tZXRoaW5nIHRvIGltcHJvdmU6Cj4K
PiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIHZob3N0L2xpbnV4LW5leHRdCj4gW2Fsc28gYnVp
bGQgdGVzdCBFUlJPUiBvbiBsaW51eC9tYXN0ZXIgbGludXMvbWFzdGVyIHY1LjYtcmM3IG5leHQt
MjAyMDAzMjRdCj4gW2lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRy
ZWUsIHBsZWFzZSBkcm9wIHVzIGEgbm90ZSB0byBoZWxwCj4gaW1wcm92ZSB0aGUgc3lzdGVtLiBC
VFcsIHdlIGFsc28gc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgb3B0aW9uIHRvIHNwZWNpZnkgdGhl
Cj4gYmFzZSB0cmVlIGluIGdpdCBmb3JtYXQtcGF0Y2gsIHBsZWFzZSBzZWUgaHR0cHM6Ly9zdGFj
a292ZXJmbG93LmNvbS9hLzM3NDA2OTgyXQo+Cj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20v
MGRheS1jaS9saW51eC9jb21taXRzL0phc29uLVdhbmcvdkRQQS1zdXBwb3J0LzIwMjAwMzI0LTE0
MjYzNAo+IGJhc2U6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbXN0L3Zob3N0LmdpdCBsaW51eC1uZXh0Cj4gY29uZmlnOiBhbHBoYS1yYW5kY29uZmln
LWEwMDEtMjAyMDAzMjQgKGF0dGFjaGVkIGFzIC5jb25maWcpCj4gY29tcGlsZXI6IGFscGhhLWxp
bnV4LWdjYyAoR0NDKSA5LjIuMAo+IHJlcHJvZHVjZToKPiAgICAgICAgICB3Z2V0IGh0dHBzOi8v
cmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFr
ZS5jcm9zcyAtTyB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAgICAgY2htb2QgK3ggfi9iaW4vbWFr
ZS5jcm9zcwo+ICAgICAgICAgICMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51eCBi
dWlsZCB0cmVlCj4gICAgICAgICAgR0NDX1ZFUlNJT049OS4yLjAgbWFrZS5jcm9zcyBBUkNIPWFs
cGhhCj4KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnCj4g
UmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+Cj4gQWxsIGVy
cm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOgo+Cj4gICAgIGFscGhhLWxpbnV4LWxkOiBk
cml2ZXJzL3Zob3N0L3ZyaW5naC5vOiBpbiBmdW5jdGlvbiBgaW90bGJfdHJhbnNsYXRlJzoKPiAg
ICAgZHJpdmVycy92aG9zdC92cmluZ2guYzoxMDc5OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGB2
aG9zdF9pb3RsYl9pdHJlZV9maXJzdCcKCgpUaGlzIGlzIGJlY2F1c2UgVkhPU1Qgbm93IGRlcGVu
ZHMgb24gVkhPU1RfSU9UTEIsIGJ1dCBpdCB3YXMgc3RpbGwgCnNlbGVjdGVkIGJ5IE1JQyBvciBW
T1AuCgpXaWxsIGZpeCB0aGlzIGJ5IHN3aXRjaGluZyB0byB1c2UgImRlcGVuZHMgb24iIGZybyBN
SUMgYW5kIFZPUAoKVGhhbmtzLgoKCj4+PiBhbHBoYS1saW51eC1sZDogZHJpdmVycy92aG9zdC92
cmluZ2guYzoxMDc5OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGB2aG9zdF9pb3RsYl9pdHJlZV9m
aXJzdCcKPiAtLS0KPiAwLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlLCBJbnRlbCBDb3Jwb3Jh
dGlvbgo+IGh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9rYnVpbGQtYWxsQGxp
c3RzLjAxLm9yZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
