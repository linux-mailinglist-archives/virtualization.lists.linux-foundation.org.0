Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 818C122320A
	for <lists.virtualization@lfdr.de>; Fri, 17 Jul 2020 06:19:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2328288363;
	Fri, 17 Jul 2020 04:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZPvLLEFkkja; Fri, 17 Jul 2020 04:19:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6CDD988362;
	Fri, 17 Jul 2020 04:19:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 412F3C0733;
	Fri, 17 Jul 2020 04:19:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1F36C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 04:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7344B203F4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 04:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySgOFKXYRxpT
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 04:19:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 691E0203F2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 04:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594959592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p8lAg2x78oICwymLwcBtrZ7x/TJ3QSVkvfTDbtDIY1c=;
 b=RNoGdcNf0fRlMdRjw6YaawssOK+DFYGket/gni9LZdQdLHphw/50u1kiLyDeXSZNyqTx7s
 +MJGOWG2c0bgE+pzoIxaLrY+NTVxUYM6zBoQgKGrNBAJ30lypwiZBtKKg6ZtFX7QujrKUI
 PqHYhPusaIB8iFjF7l2rbR9piAb+mkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-iSydANI1P7Gk1OAsrv5axQ-1; Fri, 17 Jul 2020 00:19:51 -0400
X-MC-Unique: iSydANI1P7Gk1OAsrv5axQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B667E10059A9;
 Fri, 17 Jul 2020 04:19:49 +0000 (UTC)
Received: from [10.72.12.157] (ovpn-12-157.pek2.redhat.com [10.72.12.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7896A1001B07;
 Fri, 17 Jul 2020 04:19:37 +0000 (UTC)
Subject: Re: [PATCH V2 3/6] vDPA: implement IRQ offloading helpers in vDPA core
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com
References: <1594898629-18790-1-git-send-email-lingshan.zhu@intel.com>
 <1594898629-18790-4-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ab4644cc-9668-a909-4dea-5416aacf7221@redhat.com>
Date: Fri, 17 Jul 2020 12:19:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594898629-18790-4-git-send-email-lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvNy8xNiDkuIvljYg3OjIzLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgaW1wbGVtZW50cyBJUlEgb2ZmbG9hZGluZyBoZWxwZXJzCgoKTGV0J3Mgc2F5ICJ2cSBpcnEg
YWxsb2NhdGUvZnJlZSBoZWxwZXJzIiBoZXJlLgoKCj4gaW4gdkRQQSBjb3JlIGJ5Cj4gaW50cm9k
dWNpbmcgdHdvIGNvdXBsZSBvZiBmdW5jdGlvbnM6Cj4KPiB2ZHBhX2FsbG9jX3ZxX2lycSgpIGFu
ZCB2ZHBhX2ZyZWVfdnFfaXJxKCk6IHJlcXVlc3QgaXJxIGFuZCBmcmVlCj4gaXJxLCB3aWxsIHNl
dHVwIGlycSBvZmZsb2FkaW5nLgo+Cj4gdmRwYV9zZXR1cF9pcnEoKSBhbmQgdmRwYV91bnNldHVw
X2lycSgpOiBzdXBwb3J0aXZlIGZ1bmN0aW9ucywKPiB3aWxsIGNhbGwgdmhvc3RfdmRwYSBoZWxw
ZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwu
Y29tPgo+IFN1Z2dlc3RlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAt
LS0KPiAgIGRyaXZlcnMvdmRwYS92ZHBhLmMgIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gICBpbmNsdWRlL2xpbnV4L3ZkcGEuaCB8IDEzICsrKysrKysr
KysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmRwYS92ZHBhLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYS5jCj4gaW5kZXggZmY2
NTYyZi4uY2NlNGQ5MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRwYS5jCj4gKysrIGIv
ZHJpdmVycy92ZHBhL3ZkcGEuYwo+IEBAIC0xNjMsNiArMTYzLDQ4IEBAIHZvaWQgdmRwYV91bnJl
Z2lzdGVyX2RyaXZlcihzdHJ1Y3QgdmRwYV9kcml2ZXIgKmRydikKPiAgIH0KPiAgIEVYUE9SVF9T
WU1CT0xfR1BMKHZkcGFfdW5yZWdpc3Rlcl9kcml2ZXIpOwo+ICAgCj4gK3N0YXRpYyB2b2lkIHZk
cGFfc2V0dXBfaXJxKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgaW50IHFpZCwgaW50IGlycSkK
PiArewo+ICsJc3RydWN0IHZkcGFfZHJpdmVyICpkcnYgPSBkcnZfdG9fdmRwYSh2ZGV2LT5kZXYu
ZHJpdmVyKTsKPiArCj4gKwlpZiAoZHJ2LT5zZXR1cF92cV9pcnEpCj4gKwkJZHJ2LT5zZXR1cF92
cV9pcnEodmRldiwgcWlkLCBpcnEpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCB2ZHBhX3Vuc2V0
dXBfaXJxKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldiwgaW50IHFpZCkKPiArewo+ICsJc3RydWN0
IHZkcGFfZHJpdmVyICpkcnYgPSBkcnZfdG9fdmRwYSh2ZGV2LT5kZXYuZHJpdmVyKTsKPiArCj4g
KwlpZiAoZHJ2LT51bnNldHVwX3ZxX2lycSkKPiArCQlkcnYtPnVuc2V0dXBfdnFfaXJxKHZkZXYs
IHFpZCk7CgoKRG8geW91IG5lZWQgdG8gY2hlY2sgdGhlIGV4aXN0ZW5jZSBvZiBkcnYgYmVmb3Jl
IGNhbGxpbmcgdW5zZXRfdnFfaXJxKCk/CgpBbmQgaG93IGNhbiB0aGlzIHN5bmNocm9uaXplIHdp
dGggZHJpdmVyIHJlbGVhc2luZyBhbmQgYmluZGluZz8KCgo+ICt9Cj4gKwo+ICtpbnQgdmRwYV9h
bGxvY192cV9pcnEoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYs
Cj4gKwkJICAgICAgdW5zaWduZWQgaW50IGlycSwgaXJxX2hhbmRsZXJfdCBoYW5kbGVyLAo+ICsJ
CSAgICAgIHVuc2lnbmVkIGxvbmcgaXJxZmxhZ3MsIGNvbnN0IGNoYXIgKmRldm5hbWUsIHZvaWQg
KmRldl9pZCwKPiArCQkgICAgICBpbnQgcWlkKQoKCkxldCdzIGFkZCBjb21tZW50IGFzIHdoYXQg
aGFzIGJlZW4gZG9uZSBieSBvdGhlciBleHBvcnRlZCBoZWxwZXJzLgoKCj4gK3sKPiArCWludCBy
ZXQ7Cj4gKwo+ICsJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycShkZXYsIGlycSwgaGFuZGxlciwgaXJx
ZmxhZ3MsIGRldm5hbWUsIGRldl9pZCk7Cj4gKwlpZiAocmV0KQo+ICsJCWRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIHJlcXVlc3QgaXJxIGZvciB2cSAlZFxuIiwgcWlkKTsKPiArCWVsc2UKPiArCQl2
ZHBhX3NldHVwX2lycSh2ZGV2LCBxaWQsIGlycSk7Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArCj4g
K30KPiArRVhQT1JUX1NZTUJPTF9HUEwodmRwYV9hbGxvY192cV9pcnEpOwo+ICsKPiArdm9pZCB2
ZHBhX2ZyZWVfdnFfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHZkcGFfZGV2aWNlICp2
ZGV2LCBpbnQgaXJxLAo+ICsJCQkgaW50IHFpZCwgdm9pZCAqZGV2X2lkKQo+ICt7Cj4gKwlkZXZt
X2ZyZWVfaXJxKGRldiwgaXJxLCBkZXZfaWQpOwo+ICsJdmRwYV91bnNldHVwX2lycSh2ZGV2LCBx
aWQpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKHZkcGFfZnJlZV92cV9pcnEpOwo+ICsKPiAg
IHN0YXRpYyBpbnQgdmRwYV9pbml0KHZvaWQpCj4gICB7Cj4gICAJcmV0dXJuIGJ1c19yZWdpc3Rl
cigmdmRwYV9idXMpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZkcGEuaCBiL2luY2x1
ZGUvbGludXgvdmRwYS5oCj4gaW5kZXggMjM5ZGI3OS4uN2Q2NGQ4MyAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L3ZkcGEuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvdmRwYS5oCj4gQEAgLTIy
MCwxNyArMjIwLDMwIEBAIHN0cnVjdCB2ZHBhX2RldmljZSAqX192ZHBhX2FsbG9jX2RldmljZShz
dHJ1Y3QgZGV2aWNlICpwYXJlbnQsCj4gICAKPiAgIGludCB2ZHBhX3JlZ2lzdGVyX2RldmljZShz
dHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYpOwo+ICAgdm9pZCB2ZHBhX3VucmVnaXN0ZXJfZGV2aWNl
KHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldik7Cj4gKy8qIHJlcXVlc3QgaXJxIGZvciBhIHZxLCBz
ZXR1cCBpcnEgb2ZmbG9hZGluZyBpZiBpdHMgYSB2aG9zdF92ZHBhIHZxICovCgoKTGV0J3MgZG8g
dGhlIGRvY3VtZW50YXRpb24gaW4gdmRwYS5jLCBhbmQgYWdhaW4sIGRvY3VtZW50IHRoZSBkZXZy
ZXMgCmltcGxpY2F0aW9ucyBvciBqX3h4eHVzdCBuYW1lIGl0IGFzIHZkcGFfZGV2bV94eHguCgoK
PiAraW50IHZkcGFfYWxsb2NfdnFfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHZkcGFf
ZGV2aWNlICp2ZGV2LAo+ICsJCSAgICAgIHVuc2lnbmVkIGludCBpcnEsIGlycV9oYW5kbGVyX3Qg
aGFuZGxlciwKPiArCQkgICAgICB1bnNpZ25lZCBsb25nIGlycWZsYWdzLCBjb25zdCBjaGFyICpk
ZXZuYW1lLCB2b2lkICpkZXZfaWQsCj4gKwkJICAgICAgaW50IHFpZCk7Cj4gKy8qIGZyZWUgaXJx
IGZvciBhIHZxLCB1bnNldHVwIGlycSBvZmZsb2FkaW5nIGlmIGl0cyBhIHZob3N0X3ZkcGEgdnEg
Ki8KPiArdm9pZCB2ZHBhX2ZyZWVfdnFfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHZk
cGFfZGV2aWNlICp2ZGV2LCBpbnQgaXJxLAo+ICsJCSAgICAgIGludCBxaWQsIHZvaWQgKmRldl9p
ZCk7Cj4gKwo+ICAgCj4gICAvKioKPiAgICAqIHZkcGFfZHJpdmVyIC0gb3BlcmF0aW9ucyBmb3Ig
YSB2RFBBIGRyaXZlcgo+ICAgICogQGRyaXZlcjogdW5kZXJseWluZyBkZXZpY2UgZHJpdmVyCj4g
ICAgKiBAcHJvYmU6IHRoZSBmdW5jdGlvbiB0byBjYWxsIHdoZW4gYSBkZXZpY2UgaXMgZm91bmQu
ICBSZXR1cm5zIDAgb3IgLWVycm5vLgo+ICAgICogQHJlbW92ZTogdGhlIGZ1bmN0aW9uIHRvIGNh
bGwgd2hlbiBhIGRldmljZSBpcyByZW1vdmVkLgo+ICsgKiBAc2V0dXBfdnFfaXJxOiBzZXR1cCBp
cnEgb2ZmbG9hZGluZyBmb3IgYSB2aG9zdF92ZHBhIHZxLgo+ICsgKiBAdW5zZXR1cF92cV9pcnE6
IHVuc2V0dXAgb2ZmbG9hZGluZyBmb3IgYSB2aG9zdF92ZHBhIHZxLgoKCkxldCdzIG5vdCBsaW1p
dCB0aGUgbWV0aG9kcyBmb3IgYSBzcGVjaWZpYyB1c2UgY2FzZSBsaWtlIGlycSBvZmZsb2FkaW5n
IApoZXJlLgoKCj4gICAgKi8KPiAgIHN0cnVjdCB2ZHBhX2RyaXZlciB7Cj4gICAJc3RydWN0IGRl
dmljZV9kcml2ZXIgZHJpdmVyOwo+ICAgCWludCAoKnByb2JlKShzdHJ1Y3QgdmRwYV9kZXZpY2Ug
KnZkZXYpOwo+ICAgCXZvaWQgKCpyZW1vdmUpKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRldik7Cj4g
Kwl2b2lkICgqc2V0dXBfdnFfaXJxKShzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIGludCBxaWQs
IGludCBpcnEpOwo+ICsJdm9pZCAoKnVuc2V0dXBfdnFfaXJxKShzdHJ1Y3QgdmRwYV9kZXZpY2Ug
KnZkZXYsIGludCBxaWQpOwoKClRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgZXhwb3J0ZWQgaGVs
cGVyLCBsZXQncyB1c2UgCmFsbG9jX3ZxX2lycS9mcmVlX3ZxX2lycQoKVGhhbmtzCgoKPiAgIH07
Cj4gICAKPiAgICNkZWZpbmUgdmRwYV9yZWdpc3Rlcl9kcml2ZXIoZHJ2KSBcCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
