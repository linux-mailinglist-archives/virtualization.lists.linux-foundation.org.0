Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 584571F4BB9
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 05:15:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 933A786A1A;
	Wed, 10 Jun 2020 03:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZEv3eZMjoZY; Wed, 10 Jun 2020 03:15:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0738C86A44;
	Wed, 10 Jun 2020 03:15:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF975C0863;
	Wed, 10 Jun 2020 03:15:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1C4EC0863
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 03:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D7146869F8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 03:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86VdLGPhwJaR
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 03:15:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 555B386968
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 03:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591758900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hls6xNq1Wcnl3PtMqAKJbEi3ytjS3Kkmtnas8RWV+2I=;
 b=ZujmVV7e9igt8rpNLcVmP0JhT/AJLLrEA7Pu/s21s0/M2f7mamLoZgXYOtgZ+N9/0dDpUg
 F7WflCF2J20BZ1Icn/2TQA+v70wmz8tr9R+Kbl5slX4s0XneYRtW8xPVE4Fvntjfa5VkmA
 884b4VgyEcox+Y9fTfuC5nmWiii27zc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-RtfXD_q9NAGMSwq1TuXgrA-1; Tue, 09 Jun 2020 23:14:57 -0400
X-MC-Unique: RtfXD_q9NAGMSwq1TuXgrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA2231005510;
 Wed, 10 Jun 2020 03:14:56 +0000 (UTC)
Received: from [10.72.13.194] (ovpn-13-194.pek2.redhat.com [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AACA60C87;
 Wed, 10 Jun 2020 03:14:50 +0000 (UTC)
Subject: Re: [PATCH RFC v6 02/11] vhost: use batched get_vq_desc version
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200608125238.728563-1-mst@redhat.com>
 <20200608125238.728563-3-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <81904cc5-b662-028d-3b4a-bdfdbd2deb8c@redhat.com>
Date: Wed, 10 Jun 2020 11:14:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608125238.728563-3-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, eperezma@redhat.com, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNi84IOS4i+WNiDg6NTIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBBcyB0
ZXN0aW5nIHNob3dzIG5vIHBlcmZvcm1hbmNlIGNoYW5nZSwgc3dpdGNoIHRvIHRoYXQgbm93Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjAwNDAxMTgzMTE4LjgzMzQtMy1lcGVyZXpt
YUByZWRoYXQuY29tCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmhvc3QvdGVzdC5jICB8ICAgMiArLQo+ICAgZHJp
dmVycy92aG9zdC92aG9zdC5jIHwgMzE4ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAgZHJpdmVycy92aG9zdC92aG9zdC5oIHwgICA3ICstCj4gICAzIGZpbGVz
IGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyksIDI2MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3Zob3N0L3Rlc3QuYyBiL2RyaXZlcnMvdmhvc3QvdGVzdC5jCj4gaW5kZXgg
MDQ2NjkyMWY0NzcyLi43ZDY5Nzc4YWFhMjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC90
ZXN0LmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+IEBAIC0xMTksNyArMTE5LDcgQEAg
c3RhdGljIGludCB2aG9zdF90ZXN0X29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZp
bGUgKmYpCj4gICAJZGV2ID0gJm4tPmRldjsKPiAgIAl2cXNbVkhPU1RfVEVTVF9WUV0gPSAmbi0+
dnFzW1ZIT1NUX1RFU1RfVlFdOwo+ICAgCW4tPnZxc1tWSE9TVF9URVNUX1ZRXS5oYW5kbGVfa2lj
ayA9IGhhbmRsZV92cV9raWNrOwo+IC0Jdmhvc3RfZGV2X2luaXQoZGV2LCB2cXMsIFZIT1NUX1RF
U1RfVlFfTUFYLCBVSU9fTUFYSU9WLAo+ICsJdmhvc3RfZGV2X2luaXQoZGV2LCB2cXMsIFZIT1NU
X1RFU1RfVlFfTUFYLCBVSU9fTUFYSU9WICsgNjQsCj4gICAJCSAgICAgICBWSE9TVF9URVNUX1BL
VF9XRUlHSFQsIFZIT1NUX1RFU1RfV0VJR0hULCB0cnVlLCBOVUxMKTsKPiAgIAo+ICAgCWYtPnBy
aXZhdGVfZGF0YSA9IG47Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2Ry
aXZlcnMvdmhvc3Qvdmhvc3QuYwo+IGluZGV4IDE4MGI3YjU4Yzc2Yi4uNDFkNmIxMzJjMjM0IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3Qv
dmhvc3QuYwo+IEBAIC0zMDQsNiArMzA0LDcgQEAgc3RhdGljIHZvaWQgdmhvc3RfdnFfcmVzZXQo
c3RydWN0IHZob3N0X2RldiAqZGV2LAo+ICAgewo+ICAgCXZxLT5udW0gPSAxOwo+ICAgCXZxLT5u
ZGVzY3MgPSAwOwo+ICsJdnEtPmZpcnN0X2Rlc2MgPSAwOwo+ICAgCXZxLT5kZXNjID0gTlVMTDsK
PiAgIAl2cS0+YXZhaWwgPSBOVUxMOwo+ICAgCXZxLT51c2VkID0gTlVMTDsKPiBAQCAtMzcyLDYg
KzM3MywxMSBAQCBzdGF0aWMgaW50IHZob3N0X3dvcmtlcih2b2lkICpkYXRhKQo+ICAgCXJldHVy
biAwOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBpbnQgdmhvc3RfdnFfbnVtX2JhdGNoX2Rlc2NzKHN0
cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+ICt7Cj4gKwlyZXR1cm4gdnEtPm1heF9kZXNjcyAt
IFVJT19NQVhJT1Y7Cj4gK30KPiArCj4gICBzdGF0aWMgdm9pZCB2aG9zdF92cV9mcmVlX2lvdmVj
cyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPiAgIHsKPiAgIAlrZnJlZSh2cS0+ZGVzY3Mp
Owo+IEBAIC0zOTQsNiArNDAwLDkgQEAgc3RhdGljIGxvbmcgdmhvc3RfZGV2X2FsbG9jX2lvdmVj
cyhzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYpCj4gICAJZm9yIChpID0gMDsgaSA8IGRldi0+bnZxczsg
KytpKSB7Cj4gICAJCXZxID0gZGV2LT52cXNbaV07Cj4gICAJCXZxLT5tYXhfZGVzY3MgPSBkZXYt
Pmlvdl9saW1pdDsKPiArCQlpZiAodmhvc3RfdnFfbnVtX2JhdGNoX2Rlc2NzKHZxKSA8IDApIHsK
PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJfQo+ICAgCQl2cS0+ZGVzY3MgPSBrbWFsbG9jX2Fy
cmF5KHZxLT5tYXhfZGVzY3MsCj4gICAJCQkJCSAgc2l6ZW9mKCp2cS0+ZGVzY3MpLAo+ICAgCQkJ
CQkgIEdGUF9LRVJORUwpOwo+IEBAIC0xNjEwLDYgKzE2MTksNyBAQCBsb25nIHZob3N0X3ZyaW5n
X2lvY3RsKHN0cnVjdCB2aG9zdF9kZXYgKmQsIHVuc2lnbmVkIGludCBpb2N0bCwgdm9pZCBfX3Vz
ZXIgKmFyZwo+ICAgCQl2cS0+bGFzdF9hdmFpbF9pZHggPSBzLm51bTsKPiAgIAkJLyogRm9yZ2V0
IHRoZSBjYWNoZWQgaW5kZXggdmFsdWUuICovCj4gICAJCXZxLT5hdmFpbF9pZHggPSB2cS0+bGFz
dF9hdmFpbF9pZHg7Cj4gKwkJdnEtPm5kZXNjcyA9IHZxLT5maXJzdF9kZXNjID0gMDsKPiAgIAkJ
YnJlYWs7Cj4gICAJY2FzZSBWSE9TVF9HRVRfVlJJTkdfQkFTRToKPiAgIAkJcy5pbmRleCA9IGlk
eDsKPiBAQCAtMjA3OCwyNTMgKzIwODgsNiBAQCBzdGF0aWMgdW5zaWduZWQgbmV4dF9kZXNjKHN0
cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLCBzdHJ1Y3QgdnJpbmdfZGVzYyAqZGVzYykKPiAgIAly
ZXR1cm4gbmV4dDsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IGdldF9pbmRpcmVjdChzdHJ1Y3Qg
dmhvc3RfdmlydHF1ZXVlICp2cSwKPiAtCQkJc3RydWN0IGlvdmVjIGlvdltdLCB1bnNpZ25lZCBp
bnQgaW92X3NpemUsCj4gLQkJCXVuc2lnbmVkIGludCAqb3V0X251bSwgdW5zaWduZWQgaW50ICpp
bl9udW0sCj4gLQkJCXN0cnVjdCB2aG9zdF9sb2cgKmxvZywgdW5zaWduZWQgaW50ICpsb2dfbnVt
LAo+IC0JCQlzdHJ1Y3QgdnJpbmdfZGVzYyAqaW5kaXJlY3QpCj4gLXsKPiAtCXN0cnVjdCB2cmlu
Z19kZXNjIGRlc2M7Cj4gLQl1bnNpZ25lZCBpbnQgaSA9IDAsIGNvdW50LCBmb3VuZCA9IDA7Cj4g
LQl1MzIgbGVuID0gdmhvc3QzMl90b19jcHUodnEsIGluZGlyZWN0LT5sZW4pOwo+IC0Jc3RydWN0
IGlvdl9pdGVyIGZyb207Cj4gLQlpbnQgcmV0LCBhY2Nlc3M7Cj4gLQo+IC0JLyogU2FuaXR5IGNo
ZWNrICovCj4gLQlpZiAodW5saWtlbHkobGVuICUgc2l6ZW9mIGRlc2MpKSB7Cj4gLQkJdnFfZXJy
KHZxLCAiSW52YWxpZCBsZW5ndGggaW4gaW5kaXJlY3QgZGVzY3JpcHRvcjogIgo+IC0JCSAgICAg
ICAibGVuIDB4JWxseCBub3QgbXVsdGlwbGUgb2YgMHglenhcbiIsCj4gLQkJICAgICAgICh1bnNp
Z25lZCBsb25nIGxvbmcpbGVuLAo+IC0JCSAgICAgICBzaXplb2YgZGVzYyk7Cj4gLQkJcmV0dXJu
IC1FSU5WQUw7Cj4gLQl9Cj4gLQo+IC0JcmV0ID0gdHJhbnNsYXRlX2Rlc2ModnEsIHZob3N0NjRf
dG9fY3B1KHZxLCBpbmRpcmVjdC0+YWRkciksIGxlbiwgdnEtPmluZGlyZWN0LAo+IC0JCQkgICAg
IFVJT19NQVhJT1YsIFZIT1NUX0FDQ0VTU19STyk7Cj4gLQlpZiAodW5saWtlbHkocmV0IDwgMCkp
IHsKPiAtCQlpZiAocmV0ICE9IC1FQUdBSU4pCj4gLQkJCXZxX2Vycih2cSwgIlRyYW5zbGF0aW9u
IGZhaWx1cmUgJWQgaW4gaW5kaXJlY3QuXG4iLCByZXQpOwo+IC0JCXJldHVybiByZXQ7Cj4gLQl9
Cj4gLQlpb3ZfaXRlcl9pbml0KCZmcm9tLCBSRUFELCB2cS0+aW5kaXJlY3QsIHJldCwgbGVuKTsK
PiAtCj4gLQkvKiBXZSB3aWxsIHVzZSB0aGUgcmVzdWx0IGFzIGFuIGFkZHJlc3MgdG8gcmVhZCBm
cm9tLCBzbyBtb3N0Cj4gLQkgKiBhcmNoaXRlY3R1cmVzIG9ubHkgbmVlZCBhIGNvbXBpbGVyIGJh
cnJpZXIgaGVyZS4gKi8KPiAtCXJlYWRfYmFycmllcl9kZXBlbmRzKCk7Cj4gLQo+IC0JY291bnQg
PSBsZW4gLyBzaXplb2YgZGVzYzsKPiAtCS8qIEJ1ZmZlcnMgYXJlIGNoYWluZWQgdmlhIGEgMTYg
Yml0IG5leHQgZmllbGQsIHNvCj4gLQkgKiB3ZSBjYW4gaGF2ZSBhdCBtb3N0IDJeMTYgb2YgdGhl
c2UuICovCj4gLQlpZiAodW5saWtlbHkoY291bnQgPiBVU0hSVF9NQVggKyAxKSkgewo+IC0JCXZx
X2Vycih2cSwgIkluZGlyZWN0IGJ1ZmZlciBsZW5ndGggdG9vIGJpZzogJWRcbiIsCj4gLQkJICAg
ICAgIGluZGlyZWN0LT5sZW4pOwo+IC0JCXJldHVybiAtRTJCSUc7Cj4gLQl9Cj4gLQo+IC0JZG8g
ewo+IC0JCXVuc2lnbmVkIGlvdl9jb3VudCA9ICppbl9udW0gKyAqb3V0X251bTsKPiAtCQlpZiAo
dW5saWtlbHkoKytmb3VuZCA+IGNvdW50KSkgewo+IC0JCQl2cV9lcnIodnEsICJMb29wIGRldGVj
dGVkOiBsYXN0IG9uZSBhdCAldSAiCj4gLQkJCSAgICAgICAiaW5kaXJlY3Qgc2l6ZSAldVxuIiwK
PiAtCQkJICAgICAgIGksIGNvdW50KTsKPiAtCQkJcmV0dXJuIC1FSU5WQUw7Cj4gLQkJfQo+IC0J
CWlmICh1bmxpa2VseSghY29weV9mcm9tX2l0ZXJfZnVsbCgmZGVzYywgc2l6ZW9mKGRlc2MpLCAm
ZnJvbSkpKSB7Cj4gLQkJCXZxX2Vycih2cSwgIkZhaWxlZCBpbmRpcmVjdCBkZXNjcmlwdG9yOiBp
ZHggJWQsICV6eFxuIiwKPiAtCQkJICAgICAgIGksIChzaXplX3Qpdmhvc3Q2NF90b19jcHUodnEs
IGluZGlyZWN0LT5hZGRyKSArIGkgKiBzaXplb2YgZGVzYyk7Cj4gLQkJCXJldHVybiAtRUlOVkFM
Owo+IC0JCX0KPiAtCQlpZiAodW5saWtlbHkoZGVzYy5mbGFncyAmIGNwdV90b192aG9zdDE2KHZx
LCBWUklOR19ERVNDX0ZfSU5ESVJFQ1QpKSkgewo+IC0JCQl2cV9lcnIodnEsICJOZXN0ZWQgaW5k
aXJlY3QgZGVzY3JpcHRvcjogaWR4ICVkLCAlenhcbiIsCj4gLQkJCSAgICAgICBpLCAoc2l6ZV90
KXZob3N0NjRfdG9fY3B1KHZxLCBpbmRpcmVjdC0+YWRkcikgKyBpICogc2l6ZW9mIGRlc2MpOwo+
IC0JCQlyZXR1cm4gLUVJTlZBTDsKPiAtCQl9Cj4gLQo+IC0JCWlmIChkZXNjLmZsYWdzICYgY3B1
X3RvX3Zob3N0MTYodnEsIFZSSU5HX0RFU0NfRl9XUklURSkpCj4gLQkJCWFjY2VzcyA9IFZIT1NU
X0FDQ0VTU19XTzsKPiAtCQllbHNlCj4gLQkJCWFjY2VzcyA9IFZIT1NUX0FDQ0VTU19STzsKPiAt
Cj4gLQkJcmV0ID0gdHJhbnNsYXRlX2Rlc2ModnEsIHZob3N0NjRfdG9fY3B1KHZxLCBkZXNjLmFk
ZHIpLAo+IC0JCQkJICAgICB2aG9zdDMyX3RvX2NwdSh2cSwgZGVzYy5sZW4pLCBpb3YgKyBpb3Zf
Y291bnQsCj4gLQkJCQkgICAgIGlvdl9zaXplIC0gaW92X2NvdW50LCBhY2Nlc3MpOwo+IC0JCWlm
ICh1bmxpa2VseShyZXQgPCAwKSkgewo+IC0JCQlpZiAocmV0ICE9IC1FQUdBSU4pCj4gLQkJCQl2
cV9lcnIodnEsICJUcmFuc2xhdGlvbiBmYWlsdXJlICVkIGluZGlyZWN0IGlkeCAlZFxuIiwKPiAt
CQkJCQlyZXQsIGkpOwo+IC0JCQlyZXR1cm4gcmV0Owo+IC0JCX0KPiAtCQkvKiBJZiB0aGlzIGlz
IGFuIGlucHV0IGRlc2NyaXB0b3IsIGluY3JlbWVudCB0aGF0IGNvdW50LiAqLwo+IC0JCWlmIChh
Y2Nlc3MgPT0gVkhPU1RfQUNDRVNTX1dPKSB7Cj4gLQkJCSppbl9udW0gKz0gcmV0Owo+IC0JCQlp
ZiAodW5saWtlbHkobG9nICYmIHJldCkpIHsKPiAtCQkJCWxvZ1sqbG9nX251bV0uYWRkciA9IHZo
b3N0NjRfdG9fY3B1KHZxLCBkZXNjLmFkZHIpOwo+IC0JCQkJbG9nWypsb2dfbnVtXS5sZW4gPSB2
aG9zdDMyX3RvX2NwdSh2cSwgZGVzYy5sZW4pOwo+IC0JCQkJKysqbG9nX251bTsKPiAtCQkJfQo+
IC0JCX0gZWxzZSB7Cj4gLQkJCS8qIElmIGl0J3MgYW4gb3V0cHV0IGRlc2NyaXB0b3IsIHRoZXkn
cmUgYWxsIHN1cHBvc2VkCj4gLQkJCSAqIHRvIGNvbWUgYmVmb3JlIGFueSBpbnB1dCBkZXNjcmlw
dG9ycy4gKi8KPiAtCQkJaWYgKHVubGlrZWx5KCppbl9udW0pKSB7Cj4gLQkJCQl2cV9lcnIodnEs
ICJJbmRpcmVjdCBkZXNjcmlwdG9yICIKPiAtCQkJCSAgICAgICAiaGFzIG91dCBhZnRlciBpbjog
aWR4ICVkXG4iLCBpKTsKPiAtCQkJCXJldHVybiAtRUlOVkFMOwo+IC0JCQl9Cj4gLQkJCSpvdXRf
bnVtICs9IHJldDsKPiAtCQl9Cj4gLQl9IHdoaWxlICgoaSA9IG5leHRfZGVzYyh2cSwgJmRlc2Mp
KSAhPSAtMSk7Cj4gLQlyZXR1cm4gMDsKPiAtfQo+IC0KPiAtLyogVGhpcyBsb29rcyBpbiB0aGUg
dmlydHF1ZXVlIGFuZCBmb3IgdGhlIGZpcnN0IGF2YWlsYWJsZSBidWZmZXIsIGFuZCBjb252ZXJ0
cwo+IC0gKiBpdCB0byBhbiBpb3ZlYyBmb3IgY29udmVuaWVudCBhY2Nlc3MuICBTaW5jZSBkZXNj
cmlwdG9ycyBjb25zaXN0IG9mIHNvbWUKPiAtICogbnVtYmVyIG9mIG91dHB1dCB0aGVuIHNvbWUg
bnVtYmVyIG9mIGlucHV0IGRlc2NyaXB0b3JzLCBpdCdzIGFjdHVhbGx5IHR3bwo+IC0gKiBpb3Zl
Y3MsIGJ1dCB3ZSBwYWNrIHRoZW0gaW50byBvbmUgYW5kIG5vdGUgaG93IG1hbnkgb2YgZWFjaCB0
aGVyZSB3ZXJlLgo+IC0gKgo+IC0gKiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgdGhlIGRlc2NyaXB0
b3IgbnVtYmVyIGZvdW5kLCBvciB2cS0+bnVtICh3aGljaCBpcwo+IC0gKiBuZXZlciBhIHZhbGlk
IGRlc2NyaXB0b3IgbnVtYmVyKSBpZiBub25lIHdhcyBmb3VuZC4gIEEgbmVnYXRpdmUgY29kZSBp
cwo+IC0gKiByZXR1cm5lZCBvbiBlcnJvci4gKi8KPiAtaW50IHZob3N0X2dldF92cV9kZXNjKHN0
cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLAo+IC0JCSAgICAgIHN0cnVjdCBpb3ZlYyBpb3ZbXSwg
dW5zaWduZWQgaW50IGlvdl9zaXplLAo+IC0JCSAgICAgIHVuc2lnbmVkIGludCAqb3V0X251bSwg
dW5zaWduZWQgaW50ICppbl9udW0sCj4gLQkJICAgICAgc3RydWN0IHZob3N0X2xvZyAqbG9nLCB1
bnNpZ25lZCBpbnQgKmxvZ19udW0pCj4gLXsKPiAtCXN0cnVjdCB2cmluZ19kZXNjIGRlc2M7Cj4g
LQl1bnNpZ25lZCBpbnQgaSwgaGVhZCwgZm91bmQgPSAwOwo+IC0JdTE2IGxhc3RfYXZhaWxfaWR4
Owo+IC0JX192aXJ0aW8xNiBhdmFpbF9pZHg7Cj4gLQlfX3ZpcnRpbzE2IHJpbmdfaGVhZDsKPiAt
CWludCByZXQsIGFjY2VzczsKPiAtCj4gLQkvKiBDaGVjayBpdCBpc24ndCBkb2luZyB2ZXJ5IHN0
cmFuZ2UgdGhpbmdzIHdpdGggZGVzY3JpcHRvciBudW1iZXJzLiAqLwo+IC0JbGFzdF9hdmFpbF9p
ZHggPSB2cS0+bGFzdF9hdmFpbF9pZHg7Cj4gLQo+IC0JaWYgKHZxLT5hdmFpbF9pZHggPT0gdnEt
Pmxhc3RfYXZhaWxfaWR4KSB7Cj4gLQkJaWYgKHVubGlrZWx5KHZob3N0X2dldF9hdmFpbF9pZHgo
dnEsICZhdmFpbF9pZHgpKSkgewo+IC0JCQl2cV9lcnIodnEsICJGYWlsZWQgdG8gYWNjZXNzIGF2
YWlsIGlkeCBhdCAlcFxuIiwKPiAtCQkJCSZ2cS0+YXZhaWwtPmlkeCk7Cj4gLQkJCXJldHVybiAt
RUZBVUxUOwo+IC0JCX0KPiAtCQl2cS0+YXZhaWxfaWR4ID0gdmhvc3QxNl90b19jcHUodnEsIGF2
YWlsX2lkeCk7Cj4gLQo+IC0JCWlmICh1bmxpa2VseSgodTE2KSh2cS0+YXZhaWxfaWR4IC0gbGFz
dF9hdmFpbF9pZHgpID4gdnEtPm51bSkpIHsKPiAtCQkJdnFfZXJyKHZxLCAiR3Vlc3QgbW92ZWQg
dXNlZCBpbmRleCBmcm9tICV1IHRvICV1IiwKPiAtCQkJCWxhc3RfYXZhaWxfaWR4LCB2cS0+YXZh
aWxfaWR4KTsKPiAtCQkJcmV0dXJuIC1FRkFVTFQ7Cj4gLQkJfQo+IC0KPiAtCQkvKiBJZiB0aGVy
ZSdzIG5vdGhpbmcgbmV3IHNpbmNlIGxhc3Qgd2UgbG9va2VkLCByZXR1cm4KPiAtCQkgKiBpbnZh
bGlkLgo+IC0JCSAqLwo+IC0JCWlmICh2cS0+YXZhaWxfaWR4ID09IGxhc3RfYXZhaWxfaWR4KQo+
IC0JCQlyZXR1cm4gdnEtPm51bTsKPiAtCj4gLQkJLyogT25seSBnZXQgYXZhaWwgcmluZyBlbnRy
aWVzIGFmdGVyIHRoZXkgaGF2ZSBiZWVuCj4gLQkJICogZXhwb3NlZCBieSBndWVzdC4KPiAtCQkg
Ki8KPiAtCQlzbXBfcm1iKCk7Cj4gLQl9Cj4gLQo+IC0JLyogR3JhYiB0aGUgbmV4dCBkZXNjcmlw
dG9yIG51bWJlciB0aGV5J3JlIGFkdmVydGlzaW5nLCBhbmQgaW5jcmVtZW50Cj4gLQkgKiB0aGUg
aW5kZXggd2UndmUgc2Vlbi4gKi8KPiAtCWlmICh1bmxpa2VseSh2aG9zdF9nZXRfYXZhaWxfaGVh
ZCh2cSwgJnJpbmdfaGVhZCwgbGFzdF9hdmFpbF9pZHgpKSkgewo+IC0JCXZxX2Vycih2cSwgIkZh
aWxlZCB0byByZWFkIGhlYWQ6IGlkeCAlZCBhZGRyZXNzICVwXG4iLAo+IC0JCSAgICAgICBsYXN0
X2F2YWlsX2lkeCwKPiAtCQkgICAgICAgJnZxLT5hdmFpbC0+cmluZ1tsYXN0X2F2YWlsX2lkeCAl
IHZxLT5udW1dKTsKPiAtCQlyZXR1cm4gLUVGQVVMVDsKPiAtCX0KPiAtCj4gLQloZWFkID0gdmhv
c3QxNl90b19jcHUodnEsIHJpbmdfaGVhZCk7Cj4gLQo+IC0JLyogSWYgdGhlaXIgbnVtYmVyIGlz
IHNpbGx5LCB0aGF0J3MgYW4gZXJyb3IuICovCj4gLQlpZiAodW5saWtlbHkoaGVhZCA+PSB2cS0+
bnVtKSkgewo+IC0JCXZxX2Vycih2cSwgIkd1ZXN0IHNheXMgaW5kZXggJXUgPiAldSBpcyBhdmFp
bGFibGUiLAo+IC0JCSAgICAgICBoZWFkLCB2cS0+bnVtKTsKPiAtCQlyZXR1cm4gLUVJTlZBTDsK
PiAtCX0KPiAtCj4gLQkvKiBXaGVuIHdlIHN0YXJ0IHRoZXJlIGFyZSBub25lIG9mIGVpdGhlciBp
bnB1dCBub3Igb3V0cHV0LiAqLwo+IC0JKm91dF9udW0gPSAqaW5fbnVtID0gMDsKPiAtCWlmICh1
bmxpa2VseShsb2cpKQo+IC0JCSpsb2dfbnVtID0gMDsKPiAtCj4gLQlpID0gaGVhZDsKPiAtCWRv
IHsKPiAtCQl1bnNpZ25lZCBpb3ZfY291bnQgPSAqaW5fbnVtICsgKm91dF9udW07Cj4gLQkJaWYg
KHVubGlrZWx5KGkgPj0gdnEtPm51bSkpIHsKPiAtCQkJdnFfZXJyKHZxLCAiRGVzYyBpbmRleCBp
cyAldSA+ICV1LCBoZWFkID0gJXUiLAo+IC0JCQkgICAgICAgaSwgdnEtPm51bSwgaGVhZCk7Cj4g
LQkJCXJldHVybiAtRUlOVkFMOwo+IC0JCX0KPiAtCQlpZiAodW5saWtlbHkoKytmb3VuZCA+IHZx
LT5udW0pKSB7Cj4gLQkJCXZxX2Vycih2cSwgIkxvb3AgZGV0ZWN0ZWQ6IGxhc3Qgb25lIGF0ICV1
ICIKPiAtCQkJICAgICAgICJ2cSBzaXplICV1IGhlYWQgJXVcbiIsCj4gLQkJCSAgICAgICBpLCB2
cS0+bnVtLCBoZWFkKTsKPiAtCQkJcmV0dXJuIC1FSU5WQUw7Cj4gLQkJfQo+IC0JCXJldCA9IHZo
b3N0X2dldF9kZXNjKHZxLCAmZGVzYywgaSk7Cj4gLQkJaWYgKHVubGlrZWx5KHJldCkpIHsKPiAt
CQkJdnFfZXJyKHZxLCAiRmFpbGVkIHRvIGdldCBkZXNjcmlwdG9yOiBpZHggJWQgYWRkciAlcFxu
IiwKPiAtCQkJICAgICAgIGksIHZxLT5kZXNjICsgaSk7Cj4gLQkJCXJldHVybiAtRUZBVUxUOwo+
IC0JCX0KPiAtCQlpZiAoZGVzYy5mbGFncyAmIGNwdV90b192aG9zdDE2KHZxLCBWUklOR19ERVND
X0ZfSU5ESVJFQ1QpKSB7Cj4gLQkJCXJldCA9IGdldF9pbmRpcmVjdCh2cSwgaW92LCBpb3Zfc2l6
ZSwKPiAtCQkJCQkgICBvdXRfbnVtLCBpbl9udW0sCj4gLQkJCQkJICAgbG9nLCBsb2dfbnVtLCAm
ZGVzYyk7Cj4gLQkJCWlmICh1bmxpa2VseShyZXQgPCAwKSkgewo+IC0JCQkJaWYgKHJldCAhPSAt
RUFHQUlOKQo+IC0JCQkJCXZxX2Vycih2cSwgIkZhaWx1cmUgZGV0ZWN0ZWQgIgo+IC0JCQkJCQki
aW4gaW5kaXJlY3QgZGVzY3JpcHRvciBhdCBpZHggJWRcbiIsIGkpOwo+IC0JCQkJcmV0dXJuIHJl
dDsKPiAtCQkJfQo+IC0JCQljb250aW51ZTsKPiAtCQl9Cj4gLQo+IC0JCWlmIChkZXNjLmZsYWdz
ICYgY3B1X3RvX3Zob3N0MTYodnEsIFZSSU5HX0RFU0NfRl9XUklURSkpCj4gLQkJCWFjY2VzcyA9
IFZIT1NUX0FDQ0VTU19XTzsKPiAtCQllbHNlCj4gLQkJCWFjY2VzcyA9IFZIT1NUX0FDQ0VTU19S
TzsKPiAtCQlyZXQgPSB0cmFuc2xhdGVfZGVzYyh2cSwgdmhvc3Q2NF90b19jcHUodnEsIGRlc2Mu
YWRkciksCj4gLQkJCQkgICAgIHZob3N0MzJfdG9fY3B1KHZxLCBkZXNjLmxlbiksIGlvdiArIGlv
dl9jb3VudCwKPiAtCQkJCSAgICAgaW92X3NpemUgLSBpb3ZfY291bnQsIGFjY2Vzcyk7Cj4gLQkJ
aWYgKHVubGlrZWx5KHJldCA8IDApKSB7Cj4gLQkJCWlmIChyZXQgIT0gLUVBR0FJTikKPiAtCQkJ
CXZxX2Vycih2cSwgIlRyYW5zbGF0aW9uIGZhaWx1cmUgJWQgZGVzY3JpcHRvciBpZHggJWRcbiIs
Cj4gLQkJCQkJcmV0LCBpKTsKPiAtCQkJcmV0dXJuIHJldDsKPiAtCQl9Cj4gLQkJaWYgKGFjY2Vz
cyA9PSBWSE9TVF9BQ0NFU1NfV08pIHsKPiAtCQkJLyogSWYgdGhpcyBpcyBhbiBpbnB1dCBkZXNj
cmlwdG9yLAo+IC0JCQkgKiBpbmNyZW1lbnQgdGhhdCBjb3VudC4gKi8KPiAtCQkJKmluX251bSAr
PSByZXQ7Cj4gLQkJCWlmICh1bmxpa2VseShsb2cgJiYgcmV0KSkgewo+IC0JCQkJbG9nWypsb2df
bnVtXS5hZGRyID0gdmhvc3Q2NF90b19jcHUodnEsIGRlc2MuYWRkcik7Cj4gLQkJCQlsb2dbKmxv
Z19udW1dLmxlbiA9IHZob3N0MzJfdG9fY3B1KHZxLCBkZXNjLmxlbik7Cj4gLQkJCQkrKypsb2df
bnVtOwo+IC0JCQl9Cj4gLQkJfSBlbHNlIHsKPiAtCQkJLyogSWYgaXQncyBhbiBvdXRwdXQgZGVz
Y3JpcHRvciwgdGhleSdyZSBhbGwgc3VwcG9zZWQKPiAtCQkJICogdG8gY29tZSBiZWZvcmUgYW55
IGlucHV0IGRlc2NyaXB0b3JzLiAqLwo+IC0JCQlpZiAodW5saWtlbHkoKmluX251bSkpIHsKPiAt
CQkJCXZxX2Vycih2cSwgIkRlc2NyaXB0b3IgaGFzIG91dCBhZnRlciBpbjogIgo+IC0JCQkJICAg
ICAgICJpZHggJWRcbiIsIGkpOwo+IC0JCQkJcmV0dXJuIC1FSU5WQUw7Cj4gLQkJCX0KPiAtCQkJ
Km91dF9udW0gKz0gcmV0Owo+IC0JCX0KPiAtCX0gd2hpbGUgKChpID0gbmV4dF9kZXNjKHZxLCAm
ZGVzYykpICE9IC0xKTsKPiAtCj4gLQkvKiBPbiBzdWNjZXNzLCBpbmNyZW1lbnQgYXZhaWwgaW5k
ZXguICovCj4gLQl2cS0+bGFzdF9hdmFpbF9pZHgrKzsKPiAtCj4gLQkvKiBBc3N1bWUgbm90aWZp
Y2F0aW9ucyBmcm9tIGd1ZXN0IGFyZSBkaXNhYmxlZCBhdCB0aGlzIHBvaW50LAo+IC0JICogaWYg
dGhleSBhcmVuJ3Qgd2Ugd291bGQgbmVlZCB0byB1cGRhdGUgYXZhaWxfZXZlbnQgaW5kZXguICov
Cj4gLQlCVUdfT04oISh2cS0+dXNlZF9mbGFncyAmIFZSSU5HX1VTRURfRl9OT19OT1RJRlkpKTsK
PiAtCXJldHVybiBoZWFkOwo+IC19Cj4gLUVYUE9SVF9TWU1CT0xfR1BMKHZob3N0X2dldF92cV9k
ZXNjKTsKPiAtCj4gICBzdGF0aWMgc3RydWN0IHZob3N0X2Rlc2MgKnBlZWtfc3BsaXRfZGVzYyhz
dHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPiAgIHsKPiAgIAlCVUdfT04oIXZxLT5uZGVzY3Mp
Owo+IEBAIC0yNDI4LDcgKzIxOTEsNyBAQCBzdGF0aWMgaW50IGZldGNoX2luZGlyZWN0X2Rlc2Nz
KHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLAo+ICAgCj4gICAvKiBUaGlzIGZ1bmN0aW9uIHJl
dHVybnMgYSB2YWx1ZSA+IDAgaWYgYSBkZXNjcmlwdG9yIHdhcyBmb3VuZCwgb3IgMCBpZiBub25l
IHdlcmUgZm91bmQuCj4gICAgKiBBIG5lZ2F0aXZlIGNvZGUgaXMgcmV0dXJuZWQgb24gZXJyb3Iu
ICovCj4gLXN0YXRpYyBpbnQgZmV0Y2hfZGVzY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEp
Cj4gK3N0YXRpYyBpbnQgZmV0Y2hfYnVmKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+ICAg
ewo+ICAgCXVuc2lnbmVkIGludCBpLCBoZWFkLCBmb3VuZCA9IDA7Cj4gICAJc3RydWN0IHZob3N0
X2Rlc2MgKmxhc3Q7Cj4gQEAgLTI0NDEsNyArMjIwNCwxMSBAQCBzdGF0aWMgaW50IGZldGNoX2Rl
c2NzKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+ICAgCS8qIENoZWNrIGl0IGlzbid0IGRv
aW5nIHZlcnkgc3RyYW5nZSB0aGluZ3Mgd2l0aCBkZXNjcmlwdG9yIG51bWJlcnMuICovCj4gICAJ
bGFzdF9hdmFpbF9pZHggPSB2cS0+bGFzdF9hdmFpbF9pZHg7Cj4gICAKPiAtCWlmICh2cS0+YXZh
aWxfaWR4ID09IHZxLT5sYXN0X2F2YWlsX2lkeCkgewo+ICsJaWYgKHVubGlrZWx5KHZxLT5hdmFp
bF9pZHggPT0gdnEtPmxhc3RfYXZhaWxfaWR4KSkgewo+ICsJCS8qIElmIHdlIGFscmVhZHkgaGF2
ZSB3b3JrIHRvIGRvLCBkb24ndCBib3RoZXIgcmUtY2hlY2tpbmcuICovCj4gKwkJaWYgKGxpa2Vs
eSh2cS0+bmRlc2NzKSkKPiArCQkJcmV0dXJuIDE7Cj4gKwo+ICAgCQlpZiAodW5saWtlbHkodmhv
c3RfZ2V0X2F2YWlsX2lkeCh2cSwgJmF2YWlsX2lkeCkpKSB7Cj4gICAJCQl2cV9lcnIodnEsICJG
YWlsZWQgdG8gYWNjZXNzIGF2YWlsIGlkeCBhdCAlcFxuIiwKPiAgIAkJCQkmdnEtPmF2YWlsLT5p
ZHgpOwo+IEBAIC0yNTMyLDYgKzIyOTksNDEgQEAgc3RhdGljIGludCBmZXRjaF9kZXNjcyhzdHJ1
Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPiAgIAlyZXR1cm4gMTsKPiAgIH0KPiAgIAo+ICsvKiBU
aGlzIGZ1bmN0aW9uIHJldHVybnMgYSB2YWx1ZSA+IDAgaWYgYSBkZXNjcmlwdG9yIHdhcyBmb3Vu
ZCwgb3IgMCBpZiBub25lIHdlcmUgZm91bmQuCj4gKyAqIEEgbmVnYXRpdmUgY29kZSBpcyByZXR1
cm5lZCBvbiBlcnJvci4gKi8KPiArc3RhdGljIGludCBmZXRjaF9kZXNjcyhzdHJ1Y3Qgdmhvc3Rf
dmlydHF1ZXVlICp2cSkKPiArewo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAodW5saWtlbHkodnEt
PmZpcnN0X2Rlc2MgPj0gdnEtPm5kZXNjcykpIHsKPiArCQl2cS0+Zmlyc3RfZGVzYyA9IDA7Cj4g
KwkJdnEtPm5kZXNjcyA9IDA7Cj4gKwl9Cj4gKwo+ICsJaWYgKHZxLT5uZGVzY3MpCj4gKwkJcmV0
dXJuIDE7Cj4gKwo+ICsJZm9yIChyZXQgPSAxOwo+ICsJICAgICByZXQgPiAwICYmIHZxLT5uZGVz
Y3MgPD0gdmhvc3RfdnFfbnVtX2JhdGNoX2Rlc2NzKHZxKTsKPiArCSAgICAgcmV0ID0gZmV0Y2hf
YnVmKHZxKSkKPiArCQk7Cj4gKwo+ICsJLyogT24gc3VjY2VzcyB3ZSBleHBlY3Qgc29tZSBkZXNj
cyAqLwo+ICsJQlVHX09OKHJldCA+IDAgJiYgIXZxLT5uZGVzY3MpOwo+ICsJcmV0dXJuIHJldDsK
PiArfQo+ICsKPiArLyogUmV2ZXJzZSB0aGUgZWZmZWN0cyBvZiBmZXRjaF9kZXNjcyAqLwo+ICtz
dGF0aWMgdm9pZCB1bmZldGNoX2Rlc2NzKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+ICt7
Cj4gKwlpbnQgaTsKPiArCj4gKwlmb3IgKGkgPSB2cS0+Zmlyc3RfZGVzYzsgaSA8IHZxLT5uZGVz
Y3M7ICsraSkKPiArCQlpZiAoISh2cS0+ZGVzY3NbaV0uZmxhZ3MgJiBWUklOR19ERVNDX0ZfTkVY
VCkpCj4gKwkJCXZxLT5sYXN0X2F2YWlsX2lkeCAtPSAxOwo+ICsJdnEtPm5kZXNjcyA9IDA7Cj4g
K30KCgpJcyBpdCBiZXR0ZXIgdG8gc2V0IGZpcnN0X2Rlc2MgdG8gemVybyBoZXJlPwoKCj4gKwo+
ICAgLyogVGhpcyBsb29rcyBpbiB0aGUgdmlydHF1ZXVlIGFuZCBmb3IgdGhlIGZpcnN0IGF2YWls
YWJsZSBidWZmZXIsIGFuZCBjb252ZXJ0cwo+ICAgICogaXQgdG8gYW4gaW92ZWMgZm9yIGNvbnZl
bmllbnQgYWNjZXNzLiAgU2luY2UgZGVzY3JpcHRvcnMgY29uc2lzdCBvZiBzb21lCj4gICAgKiBu
dW1iZXIgb2Ygb3V0cHV0IHRoZW4gc29tZSBudW1iZXIgb2YgaW5wdXQgZGVzY3JpcHRvcnMsIGl0
J3MgYWN0dWFsbHkgdHdvCj4gQEAgLTI1NDAsNyArMjM0Miw3IEBAIHN0YXRpYyBpbnQgZmV0Y2hf
ZGVzY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4gICAgKiBUaGlzIGZ1bmN0aW9uIHJl
dHVybnMgdGhlIGRlc2NyaXB0b3IgbnVtYmVyIGZvdW5kLCBvciB2cS0+bnVtICh3aGljaCBpcwo+
ICAgICogbmV2ZXIgYSB2YWxpZCBkZXNjcmlwdG9yIG51bWJlcikgaWYgbm9uZSB3YXMgZm91bmQu
ICBBIG5lZ2F0aXZlIGNvZGUgaXMKPiAgICAqIHJldHVybmVkIG9uIGVycm9yLiAqLwo+IC1pbnQg
dmhvc3RfZ2V0X3ZxX2Rlc2NfYmF0Y2goc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4gK2lu
dCB2aG9zdF9nZXRfdnFfZGVzYyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwKPiAgIAkJICAg
ICAgc3RydWN0IGlvdmVjIGlvdltdLCB1bnNpZ25lZCBpbnQgaW92X3NpemUsCj4gICAJCSAgICAg
IHVuc2lnbmVkIGludCAqb3V0X251bSwgdW5zaWduZWQgaW50ICppbl9udW0sCj4gICAJCSAgICAg
IHN0cnVjdCB2aG9zdF9sb2cgKmxvZywgdW5zaWduZWQgaW50ICpsb2dfbnVtKQo+IEBAIC0yNTQ5
LDcgKzIzNTEsNyBAQCBpbnQgdmhvc3RfZ2V0X3ZxX2Rlc2NfYmF0Y2goc3RydWN0IHZob3N0X3Zp
cnRxdWV1ZSAqdnEsCj4gICAJaW50IGk7Cj4gICAKPiAgIAlpZiAocmV0IDw9IDApCj4gLQkJZ290
byBlcnJfZmV0Y2g7Cj4gKwkJZ290byBlcnI7Cj4gICAKPiAgIAkvKiBOb3cgY29udmVydCB0byBJ
T1YgKi8KPiAgIAkvKiBXaGVuIHdlIHN0YXJ0IHRoZXJlIGFyZSBub25lIG9mIGVpdGhlciBpbnB1
dCBub3Igb3V0cHV0LiAqLwo+IEBAIC0yNTU3LDcgKzIzNTksNyBAQCBpbnQgdmhvc3RfZ2V0X3Zx
X2Rlc2NfYmF0Y2goc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4gICAJaWYgKHVubGlrZWx5
KGxvZykpCj4gICAJCSpsb2dfbnVtID0gMDsKPiAgIAo+IC0JZm9yIChpID0gMDsgaSA8IHZxLT5u
ZGVzY3M7ICsraSkgewo+ICsJZm9yIChpID0gdnEtPmZpcnN0X2Rlc2M7IGkgPCB2cS0+bmRlc2Nz
OyArK2kpIHsKPiAgIAkJdW5zaWduZWQgaW92X2NvdW50ID0gKmluX251bSArICpvdXRfbnVtOwo+
ICAgCQlzdHJ1Y3Qgdmhvc3RfZGVzYyAqZGVzYyA9ICZ2cS0+ZGVzY3NbaV07Cj4gICAJCWludCBh
Y2Nlc3M7Cj4gQEAgLTI2MDMsMjQgKzI0MDUsMjYgQEAgaW50IHZob3N0X2dldF92cV9kZXNjX2Jh
dGNoKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxLAo+ICAgCQl9Cj4gICAKPiAgIAkJcmV0ID0g
ZGVzYy0+aWQ7Cj4gKwo+ICsJCWlmICghKGRlc2MtPmZsYWdzICYgVlJJTkdfREVTQ19GX05FWFQp
KQo+ICsJCQlicmVhazsKPiAgIAl9Cj4gICAKPiAtCXZxLT5uZGVzY3MgPSAwOwo+ICsJdnEtPmZp
cnN0X2Rlc2MgPSBpICsgMTsKPiAgIAo+ICAgCXJldHVybiByZXQ7Cj4gICAKPiAgIGVycjoKPiAt
CXZob3N0X2Rpc2NhcmRfdnFfZGVzYyh2cSwgMSk7Cj4gLWVycl9mZXRjaDoKPiAtCXZxLT5uZGVz
Y3MgPSAwOwo+ICsJdW5mZXRjaF9kZXNjcyh2cSk7Cj4gICAKPiAgIAlyZXR1cm4gcmV0Owo+ICAg
fQo+IC1FWFBPUlRfU1lNQk9MX0dQTCh2aG9zdF9nZXRfdnFfZGVzY19iYXRjaCk7Cj4gK0VYUE9S
VF9TWU1CT0xfR1BMKHZob3N0X2dldF92cV9kZXNjKTsKPiAgIAo+ICAgLyogUmV2ZXJzZSB0aGUg
ZWZmZWN0IG9mIHZob3N0X2dldF92cV9kZXNjLiBVc2VmdWwgZm9yIGVycm9yIGhhbmRsaW5nLiAq
Lwo+ICAgdm9pZCB2aG9zdF9kaXNjYXJkX3ZxX2Rlc2Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAq
dnEsIGludCBuKQo+ICAgewo+ICsJdW5mZXRjaF9kZXNjcyh2cSk7Cj4gICAJdnEtPmxhc3RfYXZh
aWxfaWR4IC09IG47CgoKU28gdW5mZXRjaF9kZXNjcygpIGhhcyBkZWNyZWFzZWQgbGFzdF9hdmFp
bF9pZHguCgpDYW4gd2UgZml4IHRoaXMgYnkgbGV0dGluZyB1bmZldGNoX2Rlc2NzKCkgcmV0dXJu
IHRoZSBudW1iZXIgYW5kIHRoZW4gd2UgCmNhbiBkbzoKCmludCBkID0gdW5mZXRjaF9kZXNjcyh2
cSk7CnZxLT5sYXN0X2F2YWlsX2lkeCAtPSAobiA+IGQpID8gbiAtIGQ6IDA7CgpUaGFua3MKCgo+
ICAgfQo+ICAgRVhQT1JUX1NZTUJPTF9HUEwodmhvc3RfZGlzY2FyZF92cV9kZXNjKTsKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5oIGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4g
aW5kZXggODcwODlkNTE0OTBkLi5mZWQzNmFmNWM0NDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92
aG9zdC92aG9zdC5oCj4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4gQEAgLTgxLDYgKzgx
LDcgQEAgc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSB7Cj4gICAKPiAgIAlzdHJ1Y3Qgdmhvc3RfZGVz
YyAqZGVzY3M7Cj4gICAJaW50IG5kZXNjczsKPiArCWludCBmaXJzdF9kZXNjOwo+ICAgCWludCBt
YXhfZGVzY3M7Cj4gICAKPiAgIAlzdHJ1Y3QgZmlsZSAqa2ljazsKPiBAQCAtMTg5LDEwICsxOTAs
NiBAQCBsb25nIHZob3N0X3ZyaW5nX2lvY3RsKHN0cnVjdCB2aG9zdF9kZXYgKmQsIHVuc2lnbmVk
IGludCBpb2N0bCwgdm9pZCBfX3VzZXIgKmFyZwo+ICAgYm9vbCB2aG9zdF92cV9hY2Nlc3Nfb2so
c3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpOwo+ICAgYm9vbCB2aG9zdF9sb2dfYWNjZXNzX29r
KHN0cnVjdCB2aG9zdF9kZXYgKik7Cj4gICAKPiAtaW50IHZob3N0X2dldF92cV9kZXNjX2JhdGNo
KHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKiwKPiAtCQkgICAgICBzdHJ1Y3QgaW92ZWMgaW92W10s
IHVuc2lnbmVkIGludCBpb3ZfY291bnQsCj4gLQkJICAgICAgdW5zaWduZWQgaW50ICpvdXRfbnVt
LCB1bnNpZ25lZCBpbnQgKmluX251bSwKPiAtCQkgICAgICBzdHJ1Y3Qgdmhvc3RfbG9nICpsb2cs
IHVuc2lnbmVkIGludCAqbG9nX251bSk7Cj4gICBpbnQgdmhvc3RfZ2V0X3ZxX2Rlc2Moc3RydWN0
IHZob3N0X3ZpcnRxdWV1ZSAqLAo+ICAgCQkgICAgICBzdHJ1Y3QgaW92ZWMgaW92W10sIHVuc2ln
bmVkIGludCBpb3ZfY291bnQsCj4gICAJCSAgICAgIHVuc2lnbmVkIGludCAqb3V0X251bSwgdW5z
aWduZWQgaW50ICppbl9udW0sCj4gQEAgLTI2MSw2ICsyNTgsOCBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgdmhvc3RfdnFfc2V0X2JhY2tlbmQoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4gICAJ
CQkJCXZvaWQgKnByaXZhdGVfZGF0YSkKPiAgIHsKPiAgIAl2cS0+cHJpdmF0ZV9kYXRhID0gcHJp
dmF0ZV9kYXRhOwo+ICsJdnEtPm5kZXNjcyA9IDA7Cj4gKwl2cS0+Zmlyc3RfZGVzYyA9IDA7Cj4g
ICB9Cj4gICAKPiAgIC8qKgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
