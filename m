Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23C429C17
	for <lists.virtualization@lfdr.de>; Tue, 12 Oct 2021 05:50:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E8280DEE;
	Tue, 12 Oct 2021 03:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sj23O5IqLbdr; Tue, 12 Oct 2021 03:50:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 32CCF80DCC;
	Tue, 12 Oct 2021 03:50:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA6BDC001E;
	Tue, 12 Oct 2021 03:50:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E734C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 03:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFB7F4044F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 03:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fs7mVLGuT3kK
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 03:50:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2772E40421
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 03:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634010642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+oSGKY6U0mucyTgr91MMJWJ8obYh/6gFbCXzafNtPU=;
 b=QgmdcBhmBQs34NKsOCl9Y38qOYCRFi6KcYLZMIgj5iuYTzkNgaiAOTshuCzV7o5Bdeq/aN
 MojJakpYUpKKJ2kUmuAYo9jY+ZwYgAWH5FjR2rjzpfTxQ7NcCj5Ufunahgl6HoXGnbMx/Z
 ws/AnzZ/Yat/jWXcVyscNuxl96jTNwI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-K_xMQe2QO4CFT6u1HKx1Bw-1; Mon, 11 Oct 2021 23:50:41 -0400
X-MC-Unique: K_xMQe2QO4CFT6u1HKx1Bw-1
Received: by mail-lf1-f72.google.com with SMTP id
 g9-20020a0565123b8900b003f33a027130so14162558lfv.18
 for <virtualization@lists.linux-foundation.org>;
 Mon, 11 Oct 2021 20:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L+oSGKY6U0mucyTgr91MMJWJ8obYh/6gFbCXzafNtPU=;
 b=V8hwDUXMUwGzYI2kqm5IMtUiVM/HnLx+OC5qERZMR0lLl0aXYh560JZSDSEFJt6s9s
 7JoFbbUKZtjR63efiK4TFOVHDyd+8lqx6/MZGb2FByJsXyYfo4hSPWQSgYp9FjGgM3JS
 HcD4pkiF6xqFzAVt4iUJeYLv8yziR5od9rGvWSi6NwLMlVvuCvYhDiCaUGmA2xfFxy67
 hScRolgm72Wmg4FJBO5h3DPp9CZoPR0GVvv0HTj/g31kiNCLan3f94i95cDLPRK1rjIy
 zGCsiT6Q6ISWnbeHPBaUrLHnBslABSr8+z/Flyo0aLwXAqgJ8DEFyVcTEnNPuNtdaXRZ
 iPYA==
X-Gm-Message-State: AOAM530BOFxUewZ6eow55Y0vHLhsy3Adg85J1fcjGuJY9IBDn9x90cFG
 bSQfX7mZJDUVFi+qUByVeukF9uGG0kj3+YQ5fJnQDR3H8FrzQssLIELbDNzj6u8bXRTyt2PCj/H
 +p5Pdl+ZAZWBnSgXSpyhueBhSYnVGKxWiiyqdqKLeiFhKv1kIjsTkDBvJFQ==
X-Received: by 2002:ac2:43d1:: with SMTP id u17mr11759564lfl.348.1634010638806; 
 Mon, 11 Oct 2021 20:50:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhRzTewdchbZo7NgKsjabz421FBEAXZbU0n0S+sNk9UmT/W3dM8ULHfIiZiAqFGK16O3kPeZB9y21NI3XoatE=
X-Received: by 2002:ac2:43d1:: with SMTP id u17mr11759542lfl.348.1634010638524; 
 Mon, 11 Oct 2021 20:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211005134843.439050-1-eperezma@redhat.com>
 <20211005134843.439050-4-eperezma@redhat.com>
In-Reply-To: <20211005134843.439050-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Oct 2021 11:50:27 +0800
Message-ID: <CACGkMEsGAKroQysXsNnQHVVnCZcEBsL34-qnDry9JEMcefVRAw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] vdpa: Check for iova range at mappings changes
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCBPY3QgNSwgMjAyMSBhdCA5OjQ5IFBNIEV1Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IENoZWNrIHZkcGEgZGV2aWNlIHJhbmdlIGJlZm9yZSB1cGRh
dGluZyBtZW1vcnkgcmVnaW9ucyBzbyB3ZSBkb24ndCBhZGQKPiBhbnkgb3V0c2lkZSBvZiBpdCwg
YW5kIHJlcG9ydCB0aGUgaW52YWxpZCBjaGFuZ2UgaWYgYW55Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
RXVnZW5pbyBQw6lyZXogPGVwZXJlem1hQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvaHcv
dmlydGlvL3Zob3N0LXZkcGEuaCB8ICAyICsKPiAgaHcvdmlydGlvL3Zob3N0LXZkcGEuYyAgICAg
ICAgIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICBody92aXJ0aW8v
dHJhY2UtZXZlbnRzICAgICAgICAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0
aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92aXJ0
aW8vdmhvc3QtdmRwYS5oIGIvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdmRwYS5oCj4gaW5kZXgg
YTg5NjNkYTJkOS4uYzI4OGNmN2VjYiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2h3L3ZpcnRpby92
aG9zdC12ZHBhLmgKPiArKysgYi9pbmNsdWRlL2h3L3ZpcnRpby92aG9zdC12ZHBhLmgKPiBAQCAt
MTMsNiArMTMsNyBAQAo+ICAjZGVmaW5lIEhXX1ZJUlRJT19WSE9TVF9WRFBBX0gKPgo+ICAjaW5j
bHVkZSAiaHcvdmlydGlvL3ZpcnRpby5oIgo+ICsjaW5jbHVkZSAic3RhbmRhcmQtaGVhZGVycy9s
aW51eC92aG9zdF90eXBlcy5oIgo+Cj4gIHR5cGVkZWYgc3RydWN0IFZob3N0VkRQQUhvc3ROb3Rp
ZmllciB7Cj4gICAgICBNZW1vcnlSZWdpb24gbXI7Cj4gQEAgLTI0LDYgKzI1LDcgQEAgdHlwZWRl
ZiBzdHJ1Y3Qgdmhvc3RfdmRwYSB7Cj4gICAgICB1aW50MzJfdCBtc2dfdHlwZTsKPiAgICAgIGJv
b2wgaW90bGJfYmF0Y2hfYmVnaW5fc2VudDsKPiAgICAgIE1lbW9yeUxpc3RlbmVyIGxpc3RlbmVy
Owo+ICsgICAgc3RydWN0IHZob3N0X3ZkcGFfaW92YV9yYW5nZSBpb3ZhX3JhbmdlOwo+ICAgICAg
c3RydWN0IHZob3N0X2RldiAqZGV2Owo+ICAgICAgVmhvc3RWRFBBSG9zdE5vdGlmaWVyIG5vdGlm
aWVyW1ZJUlRJT19RVUVVRV9NQVhdOwo+ICB9IFZob3N0VkRQQTsKPiBkaWZmIC0tZ2l0IGEvaHcv
dmlydGlvL3Zob3N0LXZkcGEuYyBiL2h3L3ZpcnRpby92aG9zdC12ZHBhLmMKPiBpbmRleCBiZTdj
NjNiNGJhLi42NjU0Mjg3MDUwIDEwMDY0NAo+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC12ZHBhLmMK
PiArKysgYi9ody92aXJ0aW8vdmhvc3QtdmRwYS5jCj4gQEAgLTM3LDIwICszNywzNCBAQCBzdGF0
aWMgSW50MTI4IHZob3N0X3ZkcGFfc2VjdGlvbl9lbmQoY29uc3QgTWVtb3J5UmVnaW9uU2VjdGlv
biAqc2VjdGlvbikKPiAgICAgIHJldHVybiBsbGVuZDsKPiAgfQo+Cj4gLXN0YXRpYyBib29sIHZo
b3N0X3ZkcGFfbGlzdGVuZXJfc2tpcHBlZF9zZWN0aW9uKE1lbW9yeVJlZ2lvblNlY3Rpb24gKnNl
Y3Rpb24pCj4gLXsKPiAtICAgIHJldHVybiAoIW1lbW9yeV9yZWdpb25faXNfcmFtKHNlY3Rpb24t
Pm1yKSAmJgo+IC0gICAgICAgICAgICAhbWVtb3J5X3JlZ2lvbl9pc19pb21tdShzZWN0aW9uLT5t
cikpIHx8Cj4gLSAgICAgICAgICAgIG1lbW9yeV9yZWdpb25faXNfcHJvdGVjdGVkKHNlY3Rpb24t
Pm1yKSB8fAo+IC0gICAgICAgICAgIC8qIHZob3N0LXZEUEEgZG9lc24ndCBhbGxvdyBNTUlPIHRv
IGJlIG1hcHBlZCAgKi8KPiAtICAgICAgICAgICAgbWVtb3J5X3JlZ2lvbl9pc19yYW1fZGV2aWNl
KHNlY3Rpb24tPm1yKSB8fAo+IC0gICAgICAgICAgIC8qCj4gLSAgICAgICAgICAgICogU2l6aW5n
IGFuIGVuYWJsZWQgNjQtYml0IEJBUiBjYW4gY2F1c2Ugc3B1cmlvdXMgbWFwcGluZ3MgdG8KPiAt
ICAgICAgICAgICAgKiBhZGRyZXNzZXMgaW4gdGhlIHVwcGVyIHBhcnQgb2YgdGhlIDY0LWJpdCBh
ZGRyZXNzIHNwYWNlLiAgVGhlc2UKPiAtICAgICAgICAgICAgKiBhcmUgbmV2ZXIgYWNjZXNzZWQg
YnkgdGhlIENQVSBhbmQgYmV5b25kIHRoZSBhZGRyZXNzIHdpZHRoIG9mCj4gLSAgICAgICAgICAg
ICogc29tZSBJT01NVSBoYXJkd2FyZS4gIFRPRE86IFZEUEEgc2hvdWxkIHRlbGwgdXMgdGhlIElP
TU1VIHdpZHRoLgo+IC0gICAgICAgICAgICAqLwo+IC0gICAgICAgICAgIHNlY3Rpb24tPm9mZnNl
dF93aXRoaW5fYWRkcmVzc19zcGFjZSAmICgxVUxMIDw8IDYzKTsKPiArc3RhdGljIGJvb2wgdmhv
c3RfdmRwYV9saXN0ZW5lcl9za2lwcGVkX3NlY3Rpb24oTWVtb3J5UmVnaW9uU2VjdGlvbiAqc2Vj
dGlvbiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDY0X3QgaW92YV9taW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQ2NF90IGlvdmFfbWF4KQo+ICt7Cj4gKyAgICBJbnQxMjggbGxlbmQ7
Cj4gKwo+ICsgICAgaWYgKCghbWVtb3J5X3JlZ2lvbl9pc19yYW0oc2VjdGlvbi0+bXIpICYmCj4g
KyAgICAgICAgICFtZW1vcnlfcmVnaW9uX2lzX2lvbW11KHNlY3Rpb24tPm1yKSkgfHwKPiArICAg
ICAgICBtZW1vcnlfcmVnaW9uX2lzX3Byb3RlY3RlZChzZWN0aW9uLT5tcikgfHwKPiArICAgICAg
ICAvKiB2aG9zdC12RFBBIGRvZXNuJ3QgYWxsb3cgTU1JTyB0byBiZSBtYXBwZWQgICovCj4gKyAg
ICAgICAgbWVtb3J5X3JlZ2lvbl9pc19yYW1fZGV2aWNlKHNlY3Rpb24tPm1yKSkgewo+ICsgICAg
ICAgIHJldHVybiB0cnVlOwo+ICsgICAgfQo+ICsKPiArICAgIGlmIChzZWN0aW9uLT5vZmZzZXRf
d2l0aGluX2FkZHJlc3Nfc3BhY2UgPCBpb3ZhX21pbikgewo+ICsgICAgICAgIGVycm9yX3JlcG9y
dCgiUkFNIHNlY3Rpb24gb3V0IG9mIGRldmljZSByYW5nZSAobWluPSVsdSwgYWRkcj0lbHUpIiwK
PiArICAgICAgICAgICAgICAgICAgICAgaW92YV9taW4sIHNlY3Rpb24tPm9mZnNldF93aXRoaW5f
YWRkcmVzc19zcGFjZSk7Cj4gKyAgICAgICAgcmV0dXJuIHRydWU7Cj4gKyAgICB9Cj4gKwo+ICsg
ICAgbGxlbmQgPSB2aG9zdF92ZHBhX3NlY3Rpb25fZW5kKHNlY3Rpb24pOwo+ICsgICAgaWYgKGlu
dDEyOF9ndChsbGVuZCwgaW50MTI4X21ha2U2NChpb3ZhX21heCkpKSB7Cj4gKyAgICAgICAgZXJy
b3JfcmVwb3J0KCJSQU0gc2VjdGlvbiBvdXQgb2YgZGV2aWNlIHJhbmdlIChtYXg9JWx1LCBlbmQg
YWRkcj0lbHUpIiwKPiArICAgICAgICAgICAgICAgICAgICAgaW92YV9tYXgsIGludDEyOF9nZXQ2
NChsbGVuZCkpOwo+ICsgICAgICAgIHJldHVybiB0cnVlOwo+ICsgICAgfQo+ICsKPiArICAgIHJl
dHVybiBmYWxzZTsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9kbWFfbWFwKHN0cnVj
dCB2aG9zdF92ZHBhICp2LCBod2FkZHIgaW92YSwgaHdhZGRyIHNpemUsCj4gQEAgLTE2Miw3ICsx
NzYsOCBAQCBzdGF0aWMgdm9pZCB2aG9zdF92ZHBhX2xpc3RlbmVyX3JlZ2lvbl9hZGQoTWVtb3J5
TGlzdGVuZXIgKmxpc3RlbmVyLAo+ICAgICAgdm9pZCAqdmFkZHI7Cj4gICAgICBpbnQgcmV0Owo+
Cj4gLSAgICBpZiAodmhvc3RfdmRwYV9saXN0ZW5lcl9za2lwcGVkX3NlY3Rpb24oc2VjdGlvbikp
IHsKPiArICAgIGlmICh2aG9zdF92ZHBhX2xpc3RlbmVyX3NraXBwZWRfc2VjdGlvbihzZWN0aW9u
LCB2LT5pb3ZhX3JhbmdlLmZpcnN0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHYtPmlvdmFfcmFuZ2UubGFzdCkpIHsKPiAgICAgICAgICByZXR1cm47Cj4g
ICAgICB9Cj4KPiBAQCAtMjIwLDcgKzIzNSw4IEBAIHN0YXRpYyB2b2lkIHZob3N0X3ZkcGFfbGlz
dGVuZXJfcmVnaW9uX2RlbChNZW1vcnlMaXN0ZW5lciAqbGlzdGVuZXIsCj4gICAgICBJbnQxMjgg
bGxlbmQsIGxsc2l6ZTsKPiAgICAgIGludCByZXQ7Cj4KPiAtICAgIGlmICh2aG9zdF92ZHBhX2xp
c3RlbmVyX3NraXBwZWRfc2VjdGlvbihzZWN0aW9uKSkgewo+ICsgICAgaWYgKHZob3N0X3ZkcGFf
bGlzdGVuZXJfc2tpcHBlZF9zZWN0aW9uKHNlY3Rpb24sIHYtPmlvdmFfcmFuZ2UuZmlyc3QsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdi0+aW92YV9yYW5n
ZS5sYXN0KSkgewo+ICAgICAgICAgIHJldHVybjsKPiAgICAgIH0KPgo+IEBAIC0yODgsOSArMzA0
LDI0IEBAIHN0YXRpYyB2b2lkIHZob3N0X3ZkcGFfYWRkX3N0YXR1cyhzdHJ1Y3Qgdmhvc3RfZGV2
ICpkZXYsIHVpbnQ4X3Qgc3RhdHVzKQo+ICAgICAgdmhvc3RfdmRwYV9jYWxsKGRldiwgVkhPU1Rf
VkRQQV9TRVRfU1RBVFVTLCAmcyk7Cj4gIH0KPgo+ICtzdGF0aWMgaW50IHZob3N0X3ZkcGFfZ2V0
X2lvdmFfcmFuZ2Uoc3RydWN0IHZob3N0X3ZkcGEgKnYpCj4gK3sKPiArICAgIGludCByZXQ7Cj4g
Kwo+ICsgICAgcmV0ID0gdmhvc3RfdmRwYV9jYWxsKHYtPmRldiwgVkhPU1RfVkRQQV9HRVRfSU9W
QV9SQU5HRSwgJnYtPmlvdmFfcmFuZ2UpOwo+ICsgICAgaWYgKHJldCAhPSAwKSB7Cj4gKyAgICAg
ICAgcmV0dXJuIHJldDsKPiArICAgIH0KCkkgdGhpbmsgd2UgbmVlZCBhIGZhbGxiYWNrIGZvciB0
aGUga2VybmVsIHRoYXQgZG9lcyBub3Qgc3VwcG9ydApWSE9TVF9WRFBBX0dFVF9JT1ZBX1JBTkdF
PwoKVGhhbmtzCgo+ICsKPiArICAgIHRyYWNlX3Zob3N0X3ZkcGFfZ2V0X2lvdmFfcmFuZ2Uodi0+
ZGV2LCB2LT5pb3ZhX3JhbmdlLmZpcnN0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2LT5pb3ZhX3JhbmdlLmxhc3QpOwo+ICsgICAgcmV0dXJuIHJldDsKPiArfQo+ICsK
PiAgc3RhdGljIGludCB2aG9zdF92ZHBhX2luaXQoc3RydWN0IHZob3N0X2RldiAqZGV2LCB2b2lk
ICpvcGFxdWUsIEVycm9yICoqZXJycCkKPiAgewo+ICAgICAgc3RydWN0IHZob3N0X3ZkcGEgKnY7
Cj4gKyAgICBpbnQgcjsKPiAgICAgIGFzc2VydChkZXYtPnZob3N0X29wcy0+YmFja2VuZF90eXBl
ID09IFZIT1NUX0JBQ0tFTkRfVFlQRV9WRFBBKTsKPiAgICAgIHRyYWNlX3Zob3N0X3ZkcGFfaW5p
dChkZXYsIG9wYXF1ZSk7Cj4KPiBAQCAtMzAwLDYgKzMzMSwxMSBAQCBzdGF0aWMgaW50IHZob3N0
X3ZkcGFfaW5pdChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsIHZvaWQgKm9wYXF1ZSwgRXJyb3IgKipl
cnJwKQo+ICAgICAgdi0+bGlzdGVuZXIgPSB2aG9zdF92ZHBhX21lbW9yeV9saXN0ZW5lcjsKPiAg
ICAgIHYtPm1zZ190eXBlID0gVkhPU1RfSU9UTEJfTVNHX1YyOwo+Cj4gKyAgICByID0gdmhvc3Rf
dmRwYV9nZXRfaW92YV9yYW5nZSh2KTsKPiArICAgIGlmICh1bmxpa2VseSghcikpIHsKPiArICAg
ICAgICByZXR1cm4gcjsKPiArICAgIH0KPiArCj4gICAgICB2aG9zdF92ZHBhX2FkZF9zdGF0dXMo
ZGV2LCBWSVJUSU9fQ09ORklHX1NfQUNLTk9XTEVER0UgfAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVklSVElPX0NPTkZJR19TX0RSSVZFUik7Cj4KPiBkaWZmIC0tZ2l0IGEvaHcv
dmlydGlvL3RyYWNlLWV2ZW50cyBiL2h3L3ZpcnRpby90cmFjZS1ldmVudHMKPiBpbmRleCA4ZWQx
OWU5ZDBjLi42NTBlNTIxZTM1IDEwMDY0NAo+IC0tLSBhL2h3L3ZpcnRpby90cmFjZS1ldmVudHMK
PiArKysgYi9ody92aXJ0aW8vdHJhY2UtZXZlbnRzCj4gQEAgLTUyLDYgKzUyLDcgQEAgdmhvc3Rf
dmRwYV9zZXRfdnJpbmdfY2FsbCh2b2lkICpkZXYsIHVuc2lnbmVkIGludCBpbmRleCwgaW50IGZk
KSAiZGV2OiAlcCBpbmRleDoKPiAgdmhvc3RfdmRwYV9nZXRfZmVhdHVyZXModm9pZCAqZGV2LCB1
aW50NjRfdCBmZWF0dXJlcykgImRldjogJXAgZmVhdHVyZXM6IDB4JSJQUkl4NjQKPiAgdmhvc3Rf
dmRwYV9zZXRfb3duZXIodm9pZCAqZGV2KSAiZGV2OiAlcCIKPiAgdmhvc3RfdmRwYV92cV9nZXRf
YWRkcih2b2lkICpkZXYsIHZvaWQgKnZxLCB1aW50NjRfdCBkZXNjX3VzZXJfYWRkciwgdWludDY0
X3QgYXZhaWxfdXNlcl9hZGRyLCB1aW50NjRfdCB1c2VkX3VzZXJfYWRkcikgImRldjogJXAgdnE6
ICVwIGRlc2NfdXNlcl9hZGRyOiAweCUiUFJJeDY0IiBhdmFpbF91c2VyX2FkZHI6IDB4JSJQUkl4
NjQiIHVzZWRfdXNlcl9hZGRyOiAweCUiUFJJeDY0Cj4gK3Zob3N0X3ZkcGFfZ2V0X2lvdmFfcmFu
Z2Uodm9pZCAqZGV2LCB1aW50NjRfdCBmaXJzdCwgdWludDY0X3QgbGFzdCkgImRldjogJXAgZmly
c3Q6IDB4JSJQUkl4NjQiIGxhc3Q6IDB4JSJQUkl4NjQKPgo+ICAjIHZpcnRpby5jCj4gIHZpcnRx
dWV1ZV9hbGxvY19lbGVtZW50KHZvaWQgKmVsZW0sIHNpemVfdCBzeiwgdW5zaWduZWQgaW5fbnVt
LCB1bnNpZ25lZCBvdXRfbnVtKSAiZWxlbSAlcCBzaXplICV6ZCBpbl9udW0gJXUgb3V0X251bSAl
dSIKPiAtLQo+IDIuMjcuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
