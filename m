Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2DE1ECF60
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 14:05:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E33D920367;
	Wed,  3 Jun 2020 12:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vxByb8SJMEx; Wed,  3 Jun 2020 12:05:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9DBAE2010E;
	Wed,  3 Jun 2020 12:05:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67CBCC016E;
	Wed,  3 Jun 2020 12:05:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 478D5C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 12:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 201B620367
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 12:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8jO0iu5ZnVp
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 12:04:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id BDF2C2010E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591185895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1hAyly7NhesZ77QwDd9STwcXrPYKxChvgkxKRkQ9hs=;
 b=AdFRxCnTY55kr19C0XbsRvYziO3o+KYWOcai1JbuJTCOSlMnFu3oB8qPZK6kOZMjgr0EWO
 x9n5McygfQ1HSAQsGpRJ+mLovzF9ffL6s2PHrQ4Yb5AfdXmvAQp7NebVLfa0ERazk9nP58
 5+ODqB8TIxbxY7aeocllUKY+fwrEpyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-XUmdhkusMDq-jhTXjwZ9aA-1; Wed, 03 Jun 2020 08:04:53 -0400
X-MC-Unique: XUmdhkusMDq-jhTXjwZ9aA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72AFD8018A5;
 Wed,  3 Jun 2020 12:04:52 +0000 (UTC)
Received: from [10.72.12.129] (ovpn-12-129.pek2.redhat.com [10.72.12.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32ECD10013D7;
 Wed,  3 Jun 2020 12:04:46 +0000 (UTC)
Subject: Re: [PATCH RFC 01/13] vhost: option to fetch descriptors through an
 independent struct
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-2-mst@redhat.com>
 <e35e5df9-7e36-227e-7981-232a62b06607@redhat.com>
 <20200603045825-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <48e6d644-c4aa-2754-9d06-22133987b3be@redhat.com>
Date: Wed, 3 Jun 2020 20:04:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603045825-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNi8zIOS4i+WNiDU6NDgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIEp1biAwMywgMjAyMCBhdCAwMzoxMzo1NlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzYvMiDkuIvljYg5OjA1LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6CgoKWy4u
Ll0KCgo+Pj4gKwo+Pj4gK3N0YXRpYyBpbnQgZmV0Y2hfaW5kaXJlY3RfZGVzY3Moc3RydWN0IHZo
b3N0X3ZpcnRxdWV1ZSAqdnEsCj4+PiArCQkJCXN0cnVjdCB2aG9zdF9kZXNjICppbmRpcmVjdCwK
Pj4+ICsJCQkJdTE2IGhlYWQpCj4+PiArewo+Pj4gKwlzdHJ1Y3QgdnJpbmdfZGVzYyBkZXNjOwo+
Pj4gKwl1bnNpZ25lZCBpbnQgaSA9IDAsIGNvdW50LCBmb3VuZCA9IDA7Cj4+PiArCXUzMiBsZW4g
PSBpbmRpcmVjdC0+bGVuOwo+Pj4gKwlzdHJ1Y3QgaW92X2l0ZXIgZnJvbTsKPj4+ICsJaW50IHJl
dDsKPj4+ICsKPj4+ICsJLyogU2FuaXR5IGNoZWNrICovCj4+PiArCWlmICh1bmxpa2VseShsZW4g
JSBzaXplb2YgZGVzYykpIHsKPj4+ICsJCXZxX2Vycih2cSwgIkludmFsaWQgbGVuZ3RoIGluIGlu
ZGlyZWN0IGRlc2NyaXB0b3I6ICIKPj4+ICsJCSAgICAgICAibGVuIDB4JWxseCBub3QgbXVsdGlw
bGUgb2YgMHglenhcbiIsCj4+PiArCQkgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZylsZW4sCj4+
PiArCQkgICAgICAgc2l6ZW9mIGRlc2MpOwo+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+PiArCX0K
Pj4+ICsKPj4+ICsJcmV0ID0gdHJhbnNsYXRlX2Rlc2ModnEsIGluZGlyZWN0LT5hZGRyLCBsZW4s
IHZxLT5pbmRpcmVjdCwKPj4+ICsJCQkgICAgIFVJT19NQVhJT1YsIFZIT1NUX0FDQ0VTU19STyk7
Cj4+PiArCWlmICh1bmxpa2VseShyZXQgPCAwKSkgewo+Pj4gKwkJaWYgKHJldCAhPSAtRUFHQUlO
KQo+Pj4gKwkJCXZxX2Vycih2cSwgIlRyYW5zbGF0aW9uIGZhaWx1cmUgJWQgaW4gaW5kaXJlY3Qu
XG4iLCByZXQpOwo+Pj4gKwkJcmV0dXJuIHJldDsKPj4+ICsJfQo+Pj4gKwlpb3ZfaXRlcl9pbml0
KCZmcm9tLCBSRUFELCB2cS0+aW5kaXJlY3QsIHJldCwgbGVuKTsKPj4+ICsKPj4+ICsJLyogV2Ug
d2lsbCB1c2UgdGhlIHJlc3VsdCBhcyBhbiBhZGRyZXNzIHRvIHJlYWQgZnJvbSwgc28gbW9zdAo+
Pj4gKwkgKiBhcmNoaXRlY3R1cmVzIG9ubHkgbmVlZCBhIGNvbXBpbGVyIGJhcnJpZXIgaGVyZS4g
Ki8KPj4+ICsJcmVhZF9iYXJyaWVyX2RlcGVuZHMoKTsKPj4+ICsKPj4+ICsJY291bnQgPSBsZW4g
LyBzaXplb2YgZGVzYzsKPj4+ICsJLyogQnVmZmVycyBhcmUgY2hhaW5lZCB2aWEgYSAxNiBiaXQg
bmV4dCBmaWVsZCwgc28KPj4+ICsJICogd2UgY2FuIGhhdmUgYXQgbW9zdCAyXjE2IG9mIHRoZXNl
LiAqLwo+Pj4gKwlpZiAodW5saWtlbHkoY291bnQgPiBVU0hSVF9NQVggKyAxKSkgewo+Pj4gKwkJ
dnFfZXJyKHZxLCAiSW5kaXJlY3QgYnVmZmVyIGxlbmd0aCB0b28gYmlnOiAlZFxuIiwKPj4+ICsJ
CSAgICAgICBpbmRpcmVjdC0+bGVuKTsKPj4+ICsJCXJldHVybiAtRTJCSUc7Cj4+PiArCX0KPj4+
ICsJaWYgKHVubGlrZWx5KHZxLT5uZGVzY3MgKyBjb3VudCA+IHZxLT5tYXhfZGVzY3MpKSB7Cj4+
PiArCQl2cV9lcnIodnEsICJUb28gbWFueSBpbmRpcmVjdCArIGRpcmVjdCBkZXNjczogJWQgKyAl
ZFxuIiwKPj4+ICsJCSAgICAgICB2cS0+bmRlc2NzLCBpbmRpcmVjdC0+bGVuKTsKPj4+ICsJCXJl
dHVybiAtRTJCSUc7Cj4+PiArCX0KPj4+ICsKPj4+ICsJZG8gewo+Pj4gKwkJaWYgKHVubGlrZWx5
KCsrZm91bmQgPiBjb3VudCkpIHsKPj4+ICsJCQl2cV9lcnIodnEsICJMb29wIGRldGVjdGVkOiBs
YXN0IG9uZSBhdCAldSAiCj4+PiArCQkJICAgICAgICJpbmRpcmVjdCBzaXplICV1XG4iLAo+Pj4g
KwkJCSAgICAgICBpLCBjb3VudCk7Cj4+PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4+PiArCQl9Cj4+
PiArCQlpZiAodW5saWtlbHkoIWNvcHlfZnJvbV9pdGVyX2Z1bGwoJmRlc2MsIHNpemVvZihkZXNj
KSwgJmZyb20pKSkgewo+Pj4gKwkJCXZxX2Vycih2cSwgIkZhaWxlZCBpbmRpcmVjdCBkZXNjcmlw
dG9yOiBpZHggJWQsICV6eFxuIiwKPj4+ICsJCQkgICAgICAgaSwgKHNpemVfdClpbmRpcmVjdC0+
YWRkciArIGkgKiBzaXplb2YgZGVzYyk7Cj4+PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4+PiArCQl9
Cj4+PiArCQlpZiAodW5saWtlbHkoZGVzYy5mbGFncyAmIGNwdV90b192aG9zdDE2KHZxLCBWUklO
R19ERVNDX0ZfSU5ESVJFQ1QpKSkgewo+Pj4gKwkJCXZxX2Vycih2cSwgIk5lc3RlZCBpbmRpcmVj
dCBkZXNjcmlwdG9yOiBpZHggJWQsICV6eFxuIiwKPj4+ICsJCQkgICAgICAgaSwgKHNpemVfdClp
bmRpcmVjdC0+YWRkciArIGkgKiBzaXplb2YgZGVzYyk7Cj4+PiArCQkJcmV0dXJuIC1FSU5WQUw7
Cj4+PiArCQl9Cj4+PiArCj4+PiArCQlwdXNoX3NwbGl0X2Rlc2ModnEsICZkZXNjLCBoZWFkKTsK
Pj4KPj4gVGhlIGVycm9yIGlzIGlnbm9yZWQuCj4gU2VlIGFib3ZlOgo+Cj4gICAgICAgCWlmICh1
bmxpa2VseSh2cS0+bmRlc2NzICsgY291bnQgPiB2cS0+bWF4X2Rlc2NzKSkKPgo+IFNvIGl0IGNh
bid0IGZhaWwgaGVyZSwgd2UgbmV2ZXIgZmV0Y2ggdW5sZXNzIHRoZXJlJ3Mgc3BhY2UuCj4KPiBJ
IGd1ZXNzIHdlIGNhbiBhZGQgYSBXQVJOX09OIGhlcmUuCgoKWWVzLgoKCj4KPj4+ICsJfSB3aGls
ZSAoKGkgPSBuZXh0X2Rlc2ModnEsICZkZXNjKSkgIT0gLTEpOwo+Pj4gKwlyZXR1cm4gMDsKPj4+
ICt9Cj4+PiArCj4+PiArc3RhdGljIGludCBmZXRjaF9kZXNjcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1
ZXVlICp2cSkKPj4+ICt7Cj4+PiArCXVuc2lnbmVkIGludCBpLCBoZWFkLCBmb3VuZCA9IDA7Cj4+
PiArCXN0cnVjdCB2aG9zdF9kZXNjICpsYXN0Owo+Pj4gKwlzdHJ1Y3QgdnJpbmdfZGVzYyBkZXNj
Owo+Pj4gKwlfX3ZpcnRpbzE2IGF2YWlsX2lkeDsKPj4+ICsJX192aXJ0aW8xNiByaW5nX2hlYWQ7
Cj4+PiArCXUxNiBsYXN0X2F2YWlsX2lkeDsKPj4+ICsJaW50IHJldDsKPj4+ICsKPj4+ICsJLyog
Q2hlY2sgaXQgaXNuJ3QgZG9pbmcgdmVyeSBzdHJhbmdlIHRoaW5ncyB3aXRoIGRlc2NyaXB0b3Ig
bnVtYmVycy4gKi8KPj4+ICsJbGFzdF9hdmFpbF9pZHggPSB2cS0+bGFzdF9hdmFpbF9pZHg7Cj4+
PiArCj4+PiArCWlmICh2cS0+YXZhaWxfaWR4ID09IHZxLT5sYXN0X2F2YWlsX2lkeCkgewo+Pj4g
KwkJaWYgKHVubGlrZWx5KHZob3N0X2dldF9hdmFpbF9pZHgodnEsICZhdmFpbF9pZHgpKSkgewo+
Pj4gKwkJCXZxX2Vycih2cSwgIkZhaWxlZCB0byBhY2Nlc3MgYXZhaWwgaWR4IGF0ICVwXG4iLAo+
Pj4gKwkJCQkmdnEtPmF2YWlsLT5pZHgpOwo+Pj4gKwkJCXJldHVybiAtRUZBVUxUOwo+Pj4gKwkJ
fQo+Pj4gKwkJdnEtPmF2YWlsX2lkeCA9IHZob3N0MTZfdG9fY3B1KHZxLCBhdmFpbF9pZHgpOwo+
Pj4gKwo+Pj4gKwkJaWYgKHVubGlrZWx5KCh1MTYpKHZxLT5hdmFpbF9pZHggLSBsYXN0X2F2YWls
X2lkeCkgPiB2cS0+bnVtKSkgewo+Pj4gKwkJCXZxX2Vycih2cSwgIkd1ZXN0IG1vdmVkIHVzZWQg
aW5kZXggZnJvbSAldSB0byAldSIsCj4+PiArCQkJCWxhc3RfYXZhaWxfaWR4LCB2cS0+YXZhaWxf
aWR4KTsKPj4+ICsJCQlyZXR1cm4gLUVGQVVMVDsKPj4+ICsJCX0KPj4+ICsKPj4+ICsJCS8qIElm
IHRoZXJlJ3Mgbm90aGluZyBuZXcgc2luY2UgbGFzdCB3ZSBsb29rZWQsIHJldHVybgo+Pj4gKwkJ
ICogaW52YWxpZC4KPj4+ICsJCSAqLwo+Pj4gKwkJaWYgKHZxLT5hdmFpbF9pZHggPT0gbGFzdF9h
dmFpbF9pZHgpCj4+PiArCQkJcmV0dXJuIHZxLT5udW07Cj4+PiArCj4+PiArCQkvKiBPbmx5IGdl
dCBhdmFpbCByaW5nIGVudHJpZXMgYWZ0ZXIgdGhleSBoYXZlIGJlZW4KPj4+ICsJCSAqIGV4cG9z
ZWQgYnkgZ3Vlc3QuCj4+PiArCQkgKi8KPj4+ICsJCXNtcF9ybWIoKTsKPj4+ICsJfQo+Pj4gKwo+
Pj4gKwkvKiBHcmFiIHRoZSBuZXh0IGRlc2NyaXB0b3IgbnVtYmVyIHRoZXkncmUgYWR2ZXJ0aXNp
bmcgKi8KPj4+ICsJaWYgKHVubGlrZWx5KHZob3N0X2dldF9hdmFpbF9oZWFkKHZxLCAmcmluZ19o
ZWFkLCBsYXN0X2F2YWlsX2lkeCkpKSB7Cj4+PiArCQl2cV9lcnIodnEsICJGYWlsZWQgdG8gcmVh
ZCBoZWFkOiBpZHggJWQgYWRkcmVzcyAlcFxuIiwKPj4+ICsJCSAgICAgICBsYXN0X2F2YWlsX2lk
eCwKPj4+ICsJCSAgICAgICAmdnEtPmF2YWlsLT5yaW5nW2xhc3RfYXZhaWxfaWR4ICUgdnEtPm51
bV0pOwo+Pj4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4+PiArCX0KPj4+ICsKPj4+ICsJaGVhZCA9IHZo
b3N0MTZfdG9fY3B1KHZxLCByaW5nX2hlYWQpOwo+Pj4gKwo+Pj4gKwkvKiBJZiB0aGVpciBudW1i
ZXIgaXMgc2lsbHksIHRoYXQncyBhbiBlcnJvci4gKi8KPj4+ICsJaWYgKHVubGlrZWx5KGhlYWQg
Pj0gdnEtPm51bSkpIHsKPj4+ICsJCXZxX2Vycih2cSwgIkd1ZXN0IHNheXMgaW5kZXggJXUgPiAl
dSBpcyBhdmFpbGFibGUiLAo+Pj4gKwkJICAgICAgIGhlYWQsIHZxLT5udW0pOwo+Pj4gKwkJcmV0
dXJuIC1FSU5WQUw7Cj4+PiArCX0KPj4+ICsKPj4+ICsJaSA9IGhlYWQ7Cj4+PiArCWRvIHsKPj4+
ICsJCWlmICh1bmxpa2VseShpID49IHZxLT5udW0pKSB7Cj4+PiArCQkJdnFfZXJyKHZxLCAiRGVz
YyBpbmRleCBpcyAldSA+ICV1LCBoZWFkID0gJXUiLAo+Pj4gKwkJCSAgICAgICBpLCB2cS0+bnVt
LCBoZWFkKTsKPj4+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPj4+ICsJCX0KPj4+ICsJCWlmICh1bmxp
a2VseSgrK2ZvdW5kID4gdnEtPm51bSkpIHsKPj4+ICsJCQl2cV9lcnIodnEsICJMb29wIGRldGVj
dGVkOiBsYXN0IG9uZSBhdCAldSAiCj4+PiArCQkJICAgICAgICJ2cSBzaXplICV1IGhlYWQgJXVc
biIsCj4+PiArCQkJICAgICAgIGksIHZxLT5udW0sIGhlYWQpOwo+Pj4gKwkJCXJldHVybiAtRUlO
VkFMOwo+Pj4gKwkJfQo+Pj4gKwkJcmV0ID0gdmhvc3RfZ2V0X2Rlc2ModnEsICZkZXNjLCBpKTsK
Pj4+ICsJCWlmICh1bmxpa2VseShyZXQpKSB7Cj4+PiArCQkJdnFfZXJyKHZxLCAiRmFpbGVkIHRv
IGdldCBkZXNjcmlwdG9yOiBpZHggJWQgYWRkciAlcFxuIiwKPj4+ICsJCQkgICAgICAgaSwgdnEt
PmRlc2MgKyBpKTsKPj4+ICsJCQlyZXR1cm4gLUVGQVVMVDsKPj4+ICsJCX0KPj4+ICsJCXJldCA9
IHB1c2hfc3BsaXRfZGVzYyh2cSwgJmRlc2MsIGhlYWQpOwo+Pj4gKwkJaWYgKHVubGlrZWx5KHJl
dCkpIHsKPj4+ICsJCQl2cV9lcnIodnEsICJGYWlsZWQgdG8gc2F2ZSBkZXNjcmlwdG9yOiBpZHgg
JWRcbiIsIGkpOwo+Pj4gKwkJCXJldHVybiAtRUlOVkFMOwo+Pj4gKwkJfQo+Pj4gKwl9IHdoaWxl
ICgoaSA9IG5leHRfZGVzYyh2cSwgJmRlc2MpKSAhPSAtMSk7Cj4+PiArCj4+PiArCWxhc3QgPSBw
ZWVrX3NwbGl0X2Rlc2ModnEpOwo+Pj4gKwlpZiAodW5saWtlbHkobGFzdC0+ZmxhZ3MgJiBWUklO
R19ERVNDX0ZfSU5ESVJFQ1QpKSB7Cj4+PiArCQlwb3Bfc3BsaXRfZGVzYyh2cSk7Cj4+PiArCQly
ZXQgPSBmZXRjaF9pbmRpcmVjdF9kZXNjcyh2cSwgbGFzdCwgaGVhZCk7Cj4+Cj4+IE5vdGUgdGhh
dCB0aGlzIG1lYW5zIHdlIGRvbid0IHN1cHBvcnRlZCBjaGFpbmVkIGluZGlyZWN0IGRlc2NyaXB0
b3JzIHdoaWNoCj4+IGNvbXBsaWVzIHRoZSBzcGVjIGJ1dCB3ZSBzdXBwb3J0IHRoaXMgaW4gdmhv
c3RfZ2V0X3ZxX2Rlc2MoKS4KPiBXZWxsIHRoZSBzcGVjIHNheXM6Cj4gCUEgZHJpdmVyIE1VU1Qg
Tk9UIHNldCBib3RoIFZJUlRRX0RFU0NfRl9JTkRJUkVDVCBhbmQgVklSVFFfREVTQ19GX05FWFQg
aW4gZmxhZ3MuCj4KPiBEaWQgSSBtaXNzIGFueXRoaW5nPwo+CgpObywgYnV0IEkgbWVhbnQgY3Vy
cmVudCB2aG9zdF9nZXRfdnFfZGVzYygpIHN1cHBvcnRzIGNoYWluZWQgaW5kaXJlY3QgCmRlc2Ny
aXB0b3IuIE5vdCBzdXJlIGlmIHRoZXJlJ3MgYW4gYXBwbGljYXRpb24gdGhhdCBkZXBlbmRzIG9u
IHRoaXMgCnNpbGVudGx5LgoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
