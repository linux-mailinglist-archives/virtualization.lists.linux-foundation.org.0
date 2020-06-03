Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD071EC9A0
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 08:38:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E794E87F6A;
	Wed,  3 Jun 2020 06:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lTMeCChbLgPp; Wed,  3 Jun 2020 06:38:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB1B587F59;
	Wed,  3 Jun 2020 06:38:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90800C016E;
	Wed,  3 Jun 2020 06:38:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02EA5C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 06:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DEC1B87F59
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 06:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6fIWNelr8MG
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 06:38:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7DDF087F58
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591166285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9YIEZphT4WQWpLHR5u5cJhoz+kzmhXmqU3aAWshGKzY=;
 b=aUU+q462e/yw0Hxx21FXbW0XEEDevXtAQOp/cxha5PhKXdQXnYoqhDfFnb8Q7qCSIt2NUB
 fVeaCKGZ71OKw0GsWrdOhybf9eDs2fN0hACfPVNhBKJl3xNoEOukDuAt14T72dT/V5z6ZE
 0/pJ24r1y6ZdgbH3vPXBQVTfeu/ilnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-s9_v9VnYMJaEfh0m8hUAHw-1; Wed, 03 Jun 2020 02:38:01 -0400
X-MC-Unique: s9_v9VnYMJaEfh0m8hUAHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DAC0C7441;
 Wed,  3 Jun 2020 06:37:59 +0000 (UTC)
Received: from [10.72.12.214] (ovpn-12-214.pek2.redhat.com [10.72.12.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 121E35D9CD;
 Wed,  3 Jun 2020 06:37:52 +0000 (UTC)
Subject: Re: [PATCH 4/6] vhost_vdpa: support doorbell mapping via mmap
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200529080303.15449-5-jasowang@redhat.com>
 <202006020308.kLXTHt4n%lkp@intel.com>
 <20200602005007-mutt-send-email-mst@kernel.org>
 <bd7dde11-b726-ee08-4e80-71fb784fa549@redhat.com>
 <20200602093025-mutt-send-email-mst@kernel.org>
 <5db6b413-cb6c-a566-2f2d-ad580d8e165b@redhat.com>
 <20200603023429-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3c4ed3de-00e9-2e3d-854e-4bd47063820b@redhat.com>
Date: Wed, 3 Jun 2020 14:37:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603023429-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
 kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 lingshan.zhu@intel.com, lulu@redhat.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvNi8zIOS4i+WNiDI6MzQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIEp1biAwMywgMjAyMCBhdCAxMjoxODo0NFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvMiDkuIvljYg5OjMxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBUdWUsIEp1biAwMiwgMjAyMCBhdCAwMjo0OTozOFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IE9uIDIwMjAvNi8yIOS4i+WNiDEyOjU2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4+Pj4+IE9uIFR1ZSwgSnVuIDAyLCAyMDIwIGF0IDAzOjIyOjQ5QU0gKzA4MDAsIGtidWlsZCB0
ZXN0IHJvYm90IHdyb3RlOgo+Pj4+Pj4gSGkgSmFzb24sCj4+Pj4+Pgo+Pj4+Pj4gSSBsb3ZlIHlv
dXIgcGF0Y2ghIFlldCBzb21ldGhpbmcgdG8gaW1wcm92ZToKPj4+Pj4+Cj4+Pj4+PiBbYXV0byBi
dWlsZCB0ZXN0IEVSUk9SIG9uIHZob3N0L2xpbnV4LW5leHRdCj4+Pj4+PiBbYWxzbyBidWlsZCB0
ZXN0IEVSUk9SIG9uIGxpbnVzL21hc3RlciB2NS43IG5leHQtMjAyMDA1MjldCj4+Pj4+PiBbaWYg
eW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3Ag
dXMgYSBub3RlIHRvIGhlbHAKPj4+Pj4+IGltcHJvdmUgdGhlIHN5c3RlbS4gQlRXLCB3ZSBhbHNv
IHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIG9wdGlvbiB0byBzcGVjaWZ5IHRoZQo+Pj4+Pj4gYmFz
ZSB0cmVlIGluIGdpdCBmb3JtYXQtcGF0Y2gsIHBsZWFzZSBzZWVodHRwczovL3N0YWNrb3ZlcmZs
b3cuY29tL2EvMzc0MDY5ODJdCj4+Pj4+Pgo+Pj4+Pj4gdXJsOmh0dHBzOi8vZ2l0aHViLmNvbS8w
ZGF5LWNpL2xpbnV4L2NvbW1pdHMvSmFzb24tV2FuZy92RFBBLWRvb3JiZWxsLW1hcHBpbmcvMjAy
MDA1MzEtMDcwODM0Cj4+Pj4+PiBiYXNlOmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L21zdC92aG9zdC5naXQgICBsaW51eC1uZXh0Cj4+Pj4+PiBjb25maWc6
IG02OGstcmFuZGNvbmZpZy1yMDExLTIwMjAwNjAxIChhdHRhY2hlZCBhcyAuY29uZmlnKQo+Pj4+
Pj4gY29tcGlsZXI6IG02OGstbGludXgtZ2NjIChHQ0MpIDkuMy4wCj4+Pj4+PiByZXByb2R1Y2Ug
KHRoaXMgaXMgYSBXPTEgYnVpbGQpOgo+Pj4+Pj4gICAgICAgICAgICB3Z2V0aHR0cHM6Ly9yYXcu
Z2l0aHVidXNlcmNvbnRlbnQuY29tL2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNy
b3NzICAtTyB+L2Jpbi9tYWtlLmNyb3NzCj4+Pj4+PiAgICAgICAgICAgIGNobW9kICt4IH4vYmlu
L21ha2UuY3Jvc3MKPj4+Pj4+ICAgICAgICAgICAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmln
IHRvIGxpbnV4IGJ1aWxkIHRyZWUKPj4+Pj4+ICAgICAgICAgICAgQ09NUElMRVJfSU5TVEFMTF9Q
QVRIPSRIT01FLzBkYXkgQ09NUElMRVI9Z2NjLTkuMy4wIG1ha2UuY3Jvc3MgQVJDSD1tNjhrCj4+
Pj4+Pgo+Pj4+Pj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRh
ZyBhcyBhcHByb3ByaWF0ZQo+Pj4+Pj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90PGxr
cEBpbnRlbC5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQg
YnkgPj4sIG9sZCBvbmVzIHByZWZpeGVkIGJ5IDw8KToKPj4+Pj4+Cj4+Pj4+PiBkcml2ZXJzL3Zo
b3N0L3ZkcGEuYzogSW4gZnVuY3Rpb24gJ3Zob3N0X3ZkcGFfZmF1bHQnOgo+Pj4+Pj4+PiBkcml2
ZXJzL3Zob3N0L3ZkcGEuYzo3NTQ6MjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBm
dW5jdGlvbiAncGdwcm90X25vbmNhY2hlZCcgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVj
bGFyYXRpb25dCj4+Pj4+PiA3NTQgfCAgdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3Rfbm9uY2Fj
aGVkKHZtYS0+dm1fcGFnZV9wcm90KTsKPj4+Pj4+IHwgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fgo+Pj4+Pj4+PiBkcml2ZXJzL3Zob3N0L3ZkcGEuYzo3NTQ6MjI6IGVycm9y
OiBpbmNvbXBhdGlibGUgdHlwZXMgd2hlbiBhc3NpZ25pbmcgdG8gdHlwZSAncGdwcm90X3QnIHth
a2EgJ3N0cnVjdCA8YW5vbnltb3VzPid9IGZyb20gdHlwZSAnaW50Jwo+Pj4+Pj4gY2MxOiBzb21l
IHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4+Pj4+Pgo+Pj4+Pj4gdmltICsvcGdw
cm90X25vbmNhY2hlZCArNzU0IGRyaXZlcnMvdmhvc3QvdmRwYS5jCj4+Pj4+Pgo+Pj4+Pj4gICAg
ICAgNzQyCQo+Pj4+Pj4gICAgICAgNzQzCXN0YXRpYyB2bV9mYXVsdF90IHZob3N0X3ZkcGFfZmF1
bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4+Pj4+PiAgICAgICA3NDQJewo+Pj4+Pj4gICAgICAg
NzQ1CQlzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiA9IHZtZi0+dm1hLT52bV9maWxlLT5wcml2YXRlX2Rh
dGE7Cj4+Pj4+PiAgICAgICA3NDYJCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSA9IHYtPnZkcGE7
Cj4+Pj4+PiAgICAgICA3NDcJCWNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgKm9wcyA9IHZk
cGEtPmNvbmZpZzsKPj4+Pj4+ICAgICAgIDc0OAkJc3RydWN0IHZkcGFfbm90aWZpY2F0aW9uX2Fy
ZWEgbm90aWZ5Owo+Pj4+Pj4gICAgICAgNzQ5CQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9
IHZtZi0+dm1hOwo+Pj4+Pj4gICAgICAgNzUwCQl1MTYgaW5kZXggPSB2bWEtPnZtX3Bnb2ZmOwo+
Pj4+Pj4gICAgICAgNzUxCQo+Pj4+Pj4gICAgICAgNzUyCQlub3RpZnkgPSBvcHMtPmdldF92cV9u
b3RpZmljYXRpb24odmRwYSwgaW5kZXgpOwo+Pj4+Pj4gICAgICAgNzUzCQo+Pj4+Pj4gICAgID4g
NzU0CQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF9ub25jYWNoZWQodm1hLT52bV9wYWdlX3By
b3QpOwo+Pj4+Pj4gICAgICAgNzU1CQlpZiAocmVtYXBfcGZuX3JhbmdlKHZtYSwgdm1mLT5hZGRy
ZXNzICYgUEFHRV9NQVNLLAo+Pj4+Pj4gICAgICAgNzU2CQkJCSAgICBub3RpZnkuYWRkciA+PiBQ
QUdFX1NISUZULCBQQUdFX1NJWkUsCj4+Pj4+PiAgICAgICA3NTcJCQkJICAgIHZtYS0+dm1fcGFn
ZV9wcm90KSkKPj4+Pj4+ICAgICAgIDc1OAkJCXJldHVybiBWTV9GQVVMVF9TSUdCVVM7Cj4+Pj4+
PiAgICAgICA3NTkJCj4+Pj4+PiAgICAgICA3NjAJCXJldHVybiBWTV9GQVVMVF9OT1BBR0U7Cj4+
Pj4+PiAgICAgICA3NjEJfQo+Pj4+Pj4gICAgICAgNzYyCQo+Pj4+PiBZZXMgd2VsbCwgYWxsIHRo
aXMgcmVtYXBwaW5nIGNsZWFybHkgaGFzIG5vIGNoYW5jZSB0byB3b3JrCj4+Pj4+IG9uIHN5c3Rl
bXMgd2l0aG91dCBDT05GSUdfTU1VLgo+Pj4+IEl0IGxvb2tzIHRvIG1lIG1tYXAgY2FuIHdvcmsg
YWNjb3JkaW5nIHRvIERvY3VtZW50YXRpb24vbm9tbXUtbW1hcC50eHQuIEJ1dAo+Pj4+IEknbSBu
b3Qgc3VyZSBpdCdzIHdvcnRoIHRvIGJvdGhlci4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4gV2VsbAo+
Pj4KPj4+IGludCByZW1hcF9wZm5fcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVu
c2lnbmVkIGxvbmcgYWRkciwKPj4+ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGZu
LCB1bnNpZ25lZCBsb25nIHNpemUsIHBncHJvdF90IHByb3QpCj4+PiB7Cj4+PiAgICAgICAgICAg
aWYgKGFkZHIgIT0gKHBmbiA8PCBQQUdFX1NISUZUKSkKPj4+ICAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+Pj4KPj4+ICAgICAgICAgICB2bWEtPnZtX2ZsYWdzIHw9IFZNX0lPIHwg
Vk1fUEZOTUFQIHwgVk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QOwo+Pj4gICAgICAgICAgIHJl
dHVybiAwOwo+Pj4gfQo+Pj4gRVhQT1JUX1NZTUJPTChyZW1hcF9wZm5fcmFuZ2UpOwo+Pj4KPj4+
Cj4+PiBTbyB0aGluZ3MgYXJlbid0IGdvaW5nIHRvIHdvcmsgaWYgeW91IGhhdmUgYSBmaXhlZCBQ
Rk4KPj4+IHdoaWNoIGlzIHRoZSBjYXNlIG9mIHRoZSBoYXJkd2FyZSBkZXZpY2UuCj4+IExvb2tp
bmcgYXQgdGhlIGltcGxlbWVudGF0aW9uIG9mIHNvbWUgZHJpdmVycyBlLmcgbXRkX2NoYXIuIElm
IEkgcmVhZCB0aGUKPj4gY29kZSBjb3JyZWN0bHksIHdlIGNhbiBkbyB0aGlzIGJ5IHByb3ZpZGlu
ZyBnZXRfdW5tYXBwZWRfYXJlYSBtZXRob2QgYW5kIHVzZQo+PiBwaHlzaWNhbCBhZGRyZXNzIGRp
cmVjdGx5Lgo+Pgo+PiBCdXQgc3RhcnQgZm9ybSBDT05GSUdfTU1VIHNob3VsZCBiZSBmaW5lLsKg
IERvIHlvdSBwcmVmZXIgbWFraW5nIHZob3N0X3ZkcGEKPj4gZGVwZW5kcyBvbiBDT05GSUdfTU1V
IG9yIGp1c3QgZmFpbCBtbWFwIHdoZW4gQ09ORklHX01NVSBpcyBub3QgY29uZmlndXJlZD8KPj4K
Pj4gVGhhbmtzCj4gSSdkIGp1c3Qgbm90IHNwZWNpZnkgdGhlIG1tYXAgY2FsbGJhY2sgYXQgYWxs
LgoKCk9rLCB3aWxsIGRvLgoKVGhhbmtzCgoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
