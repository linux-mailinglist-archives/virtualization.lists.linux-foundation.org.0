Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC436F526
	for <lists.virtualization@lfdr.de>; Fri, 30 Apr 2021 06:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB047430F6;
	Fri, 30 Apr 2021 04:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKDL2F02Np96; Fri, 30 Apr 2021 04:40:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4EBA430F9;
	Fri, 30 Apr 2021 04:40:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3842CC0001;
	Fri, 30 Apr 2021 04:40:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61692C0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 04:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C1F8401D5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 04:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWqj0048Ng9y
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 04:40:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 400EF430F5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 04:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619757623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=To2cLzcWVVz6lbw33RhczIcVY53+vNvAR8xbNEhzNf4=;
 b=VwwVt1ujIIBXx+QAye2uRVOLUZ6VXyDE6jEH0j2hkgAIqeCkObBCpsVqsE7N+/LHxsuyUH
 6PmK4tnpeBVASHxa/JIWUdpUZUWF+funjypo4B1B2MvycBmz+SpeSksOywsVET0zq2aqEI
 WGNWHrc4AHDqlqj+8fesoykRnJcL7EE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-QFk9OiYMMwyD7ceAnHe83w-1; Fri, 30 Apr 2021 00:40:20 -0400
X-MC-Unique: QFk9OiYMMwyD7ceAnHe83w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0506107ACCA;
 Fri, 30 Apr 2021 04:40:19 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-175.pek2.redhat.com
 [10.72.12.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CCA55D9C6;
 Fri, 30 Apr 2021 04:40:06 +0000 (UTC)
Subject: Re: [PATCH] vdpa/mlx5: Add support for doorbell bypassing
To: Eli Cohen <elic@nvidia.com>
References: <20210421104145.115907-1-elic@nvidia.com>
 <e1885255-34f2-9e90-6478-ff0850a5a3d4@redhat.com>
 <20210422060358.GA140698@mtl-vdi-166.wap.labs.mlnx>
 <20210422080725.GB140698@mtl-vdi-166.wap.labs.mlnx>
 <9d3d8976-800d-bb14-0a4a-c4b008f6872c@redhat.com>
 <20210422083902.GA146406@mtl-vdi-166.wap.labs.mlnx>
 <bdf10e38-8746-51cf-b460-a904a133329c@redhat.com>
 <20210429100033.GA215200@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fc887d99-7058-1057-2d1a-3bdc5802a59a@redhat.com>
Date: Fri, 30 Apr 2021 12:40:04 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429100033.GA215200@mtl-vdi-166.wap.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 mst@redhat.com
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

CuWcqCAyMDIxLzQvMjkg5LiL5Y2INjowMCwgRWxpIENvaGVuIOWGmemBkzoKPiBPbiBUaHUsIEFw
ciAyMiwgMjAyMSBhdCAwNDo1OToxMVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiDlnKgg
MjAyMS80LzIyIOS4i+WNiDQ6MzksIEVsaSBDb2hlbiDlhpnpgZM6Cj4+PiBPbiBUaHUsIEFwciAy
MiwgMjAyMSBhdCAwNDoyMTo0NVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+IOWcqCAy
MDIxLzQvMjIg5LiL5Y2INDowNywgRWxpIENvaGVuIOWGmemBkzoKPj4+Pj4gT24gVGh1LCBBcHIg
MjIsIDIwMjEgYXQgMDk6MDM6NThBTSArMDMwMCwgRWxpIENvaGVuIHdyb3RlOgo+Pj4+Pj4gT24g
VGh1LCBBcHIgMjIsIDIwMjEgYXQgMTA6Mzc6MzhBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4+Pj4+PiDlnKggMjAyMS80LzIxIOS4i+WNiDY6NDEsIEVsaSBDb2hlbiDlhpnpgZM6Cj4+Pj4+
Pj4+IEltcGxlbWVudCBtbHg1X2dldF92cV9ub3RpZmljYXRpb24oKSB0byByZXR1cm4gdGhlIGRv
b3JiZWxsIGFkZHJlc3MuCj4+Pj4+Pj4+IFNpemUgaXMgc2V0IHRvIG9uZSBzeXN0ZW0gcGFnZSBh
cyByZXF1aXJlZC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRWxpIENvaGVuIDxl
bGljQG52aWRpYS5jb20+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiAgICAgIGRyaXZlcnMvdmRwYS9t
bHg1L2NvcmUvbWx4NV92ZHBhLmggfCAxICsKPj4+Pj4+Pj4gICAgICBkcml2ZXJzL3ZkcGEvbWx4
NS9jb3JlL3Jlc291cmNlcy5jIHwgMSArCj4+Pj4+Pj4+ICAgICAgZHJpdmVycy92ZHBhL21seDUv
bmV0L21seDVfdm5ldC5jICB8IDYgKysrKysrCj4+Pj4+Pj4+ICAgICAgMyBmaWxlcyBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKykKPj4+Pj4+Pj4KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhLmggYi9kcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVf
dmRwYS5oCj4+Pj4+Pj4+IGluZGV4IGI2Y2M1M2JhOTgwYy4uNDlkZTYyY2RhNTk4IDEwMDY0NAo+
Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVfdmRwYS5oCj4+Pj4+Pj4+
ICsrKyBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhLmgKPj4+Pj4+Pj4gQEAgLTQx
LDYgKzQxLDcgQEAgc3RydWN0IG1seDVfdmRwYV9yZXNvdXJjZXMgewo+Pj4+Pj4+PiAgICAgIAl1
MzIgcGRuOwo+Pj4+Pj4+PiAgICAgIAlzdHJ1Y3QgbWx4NV91YXJzX3BhZ2UgKnVhcjsKPj4+Pj4+
Pj4gICAgICAJdm9pZCBfX2lvbWVtICpraWNrX2FkZHI7Cj4+Pj4+Pj4+ICsJdTY0IHBoeXNfa2lj
a19hZGRyOwo+Pj4+Pj4+PiAgICAgIAl1MTYgdWlkOwo+Pj4+Pj4+PiAgICAgIAl1MzIgbnVsbF9t
a2V5Owo+Pj4+Pj4+PiAgICAgIAlib29sIHZhbGlkOwo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy92ZHBhL21seDUvY29yZS9yZXNvdXJjZXMuYyBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUv
cmVzb3VyY2VzLmMKPj4+Pj4+Pj4gaW5kZXggNjUyMWNiZDBmNWMyLi42NjVmOGZjMTcxMGYgMTAw
NjQ0Cj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvcmVzb3VyY2VzLmMKPj4+
Pj4+Pj4gKysrIGIvZHJpdmVycy92ZHBhL21seDUvY29yZS9yZXNvdXJjZXMuYwo+Pj4+Pj4+PiBA
QCAtMjQ3LDYgKzI0Nyw3IEBAIGludCBtbHg1X3ZkcGFfYWxsb2NfcmVzb3VyY2VzKHN0cnVjdCBt
bHg1X3ZkcGFfZGV2ICptdmRldikKPj4+Pj4+Pj4gICAgICAJCWdvdG8gZXJyX2tleTsKPj4+Pj4+
Pj4gICAgICAJa2lja19hZGRyID0gbWRldi0+YmFyX2FkZHIgKyBvZmZzZXQ7Cj4+Pj4+Pj4+ICsJ
cmVzLT5waHlzX2tpY2tfYWRkciA9IGtpY2tfYWRkcjsKPj4+Pj4+Pj4gICAgICAJcmVzLT5raWNr
X2FkZHIgPSBpb3JlbWFwKGtpY2tfYWRkciwgUEFHRV9TSVpFKTsKPj4+Pj4+Pj4gICAgICAJaWYg
KCFyZXMtPmtpY2tfYWRkcikgewo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL21s
eDUvbmV0L21seDVfdm5ldC5jIGIvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4+
Pj4+Pj4+IGluZGV4IDEwYzVmZWYzYzAyMC4uNjgwNzUxMDc0ZDJhIDEwMDY0NAo+Pj4+Pj4+PiAt
LS0gYS9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMKPj4+Pj4+Pj4gKysrIGIvZHJp
dmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4+Pj4+Pj4+IEBAIC0xODY1LDggKzE4NjUs
MTQgQEAgc3RhdGljIHZvaWQgbWx4NV92ZHBhX2ZyZWUoc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2
KQo+Pj4+Pj4+PiAgICAgIHN0YXRpYyBzdHJ1Y3QgdmRwYV9ub3RpZmljYXRpb25fYXJlYSBtbHg1
X2dldF92cV9ub3RpZmljYXRpb24oc3RydWN0IHZkcGFfZGV2aWNlICp2ZGV2LCB1MTYgaWR4KQo+
Pj4+Pj4+PiAgICAgIHsKPj4+Pj4+Pj4gKwlzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYgPSB0
b19tdmRldih2ZGV2KTsKPj4+Pj4+Pj4gICAgICAJc3RydWN0IHZkcGFfbm90aWZpY2F0aW9uX2Fy
ZWEgcmV0ID0ge307Cj4+Pj4+Pj4+ICsJc3RydWN0IG1seDVfdmRwYV9uZXQgKm5kZXY7Cj4+Pj4+
Pj4+ICsKPj4+Pj4+Pj4gKwluZGV2ID0gdG9fbWx4NV92ZHBhX25kZXYobXZkZXYpOwo+Pj4+Pj4+
PiArCXJldC5hZGRyID0gKHBoeXNfYWRkcl90KW5kZXYtPm12ZGV2LnJlcy5waHlzX2tpY2tfYWRk
cjsKPj4+Pj4+Pj4gKwlyZXQuc2l6ZSA9IFBBR0VfU0laRTsKPj4+Pj4+PiBOb3RlIHRoYXQgdGhl
IHBhZ2Ugd2lsbCBiZSBtYXBwZWQgaW4gdG8gZ3Vlc3QsIHNvIGl0J3Mgb25seSBzYWZlIGlmIHRo
ZQo+Pj4+Pj4+IGRvb3JiZWVsIGV4Y2x1c2l2ZWx5IG93biB0aGUgcGFnZS4gVGhpcyBtZWFucyBp
ZiB0aGVyZSdyZSBvdGhlciByZWdpc3RlcnMgaW4KPj4+Pj4+PiB0aGUgcGFnZSwgd2UgY2FuIG5v
dCBsZXQgdGhlIGRvb3JiZWxsIGJ5cGFzcyB0byB3b3JrLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU28gdGhp
cyBpcyBzdXNwaWNpb3VzIGF0IGxlYXN0IGluIHRoZSBjYXNlIG9mIHN1YmZ1bmN0aW9uIHdoZXJl
IHdlIGNhbGN1bGF0ZQo+Pj4+Pj4+IHRoZSBiYXIgbGVuZ3RoIGluIG1seDVfc2ZfZGV2X3RhYmxl
X2NyZWF0ZSgpIGFzOgo+Pj4+Pj4+Cj4+Pj4+Pj4gdGFibGUtPnNmX2Jhcl9sZW5ndGggPSAxIDw8
IChNTFg1X0NBUF9HRU4oZGV2LCBsb2dfbWluX3NmX3NpemUpICsgMTIpOwo+Pj4+Pj4+Cj4+Pj4+
Pj4gSXQgbG9va3MgdG8gbWUgdGhpcyBjYW4gb25seSB3b3JrIGZvciB0aGUgYXJjaCB3aXRoIFBB
R0VfU0laRSA9IDQwOTYsCj4+Pj4+Pj4gb3RoZXJ3aXNlIHdlIGNhbiBtYXAgbW9yZSBpbnRvIHRo
ZSB1c2Vyc3BhY2UoZ3Vlc3QpLgo+Pj4+Pj4+Cj4+Pj4+PiBDb3JyZWN0LCBzbyBJIGd1ZXNzIEkg
c2hvdWxkIHJldHVybiBoZXJlIDQwOTYuCj4+Pj4gSSdtIG5vdCBxdWl0ZSBzdXJlIGJ1dCBzaW5j
ZSB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIHNmX2Jhcl9sZW5ndGggaXMgZG9lbgo+Pj4+IHZpYSBh
IHNoaWZ0IG9mIDEyLCBpdCBtaWdodCBiZSBjb3JyZWN0Lgo+Pj4+Cj4+Pj4gQW5kIHBsZWFzZSBk
b3VibGUgY2hlY2sgaWYgdGhlIGRvb3JiZWxsIG93biB0aGUgcGFnZSBleGNsdXNpdmVseS4KPj4+
IEkgYW0gY2hlY2tpbmcgaWYgaXQgaXMgc2FmZSB0byBtYXAgdGhlIGFueSBwYXJ0IG9mIHRoZSBT
RidzIEJBUiB0bwo+Pj4gdXNlcnNwYWNlIHdpdGhvdXQgaGFybWluZyBvdGhlciBmdW5jdGlvbnMu
IElmIHRoaXMgaXMgdHJ1ZSwgSSB3aWxsIGNoZWNrCj4+PiBpZiBJIGNhbiByZXR1cm4gUEFHRV9T
SVpFIHdpdGhvdXQgY29tcHJvbWlzaW5nIHNlY3VyaXR5Lgo+Pgo+PiBJdCdzIHVzYWxseSBub3Qg
c2FmZSBhbmQgYSBsYXllciB2aW9sYXRpb24gaWYgb3RoZXIgcmVnaXN0ZXJzIGFyZSBwbGFjZWQg
YXQKPj4gdGhlIHNhbWUgcGFnZS4KPj4KPj4KPj4+ICAgIEkgdGhpbmsgd2UgbWF5Cj4+PiBuZWVk
IHRvIGV4dGVuZCBzdHJ1Y3QgdmRwYV9ub3RpZmljYXRpb25fYXJlYSB0byBjb250YWluIGFub3Ro
ZXIgZmllbGQKPj4+IG9mZnNldCB3aGljaCBpbmRpY2F0ZXMgdGhlIG9mZnNldCBmcm9tIGFkZHIg
d2hlcmUgdGhlIGFjdHVhbCBkb29yYmVsbAo+Pj4gcmVzaWRlcy4KPj4KPj4gVGhlIG1vdml0aWF0
b24gb2YgdGhlIGN1cnJlbnQgZGVzaWduIGlzIHRvIGJlIGZpdCBzZWFtbGVzcyBpbnRvIGhvdyBR
ZW11Cj4+IG1vZGVsIGRvb3JiZWxsIGxheW91dHMgY3VycmVudGx5Ogo+Pgo+PiAxKSBwYWdlLXBl
ci12cSwgZWFjaCB2cSBoYXMgaXRzIG93biBwYWdlIGFsaWduZWQgZG9vcmJlbGwKPj4gMikgMiBi
eXRlcyBkb29yYmVsbCwgZWFjaCB2cSBoYXMgaXRzIG93biAyIGJ5dGUgYWxpZ2VuZCBkb29yYmVs
bAo+Pgo+PiBPbmx5IDEpIGlzIHN1cHBvcnQgaW4gdmhvc3QtdkRQQSAoYW5kIHZob3N0LXVzZXIp
IHNpbmNlIGl0J3MgcmF0aGVyIHNpbXBsZQo+PiBhbmQgc2VjdXJlIChwYWdlIGFsaWduZWQpIHRv
IGJlIG1vZGVsbGVkIGFuZCBpbXBsZW1lbnRlZCB2aWEgbW1hcCgpLgo+Pgo+PiBFeHBvcnRpbmcg
YSBjb21wbGV4IGxheW91dCBpcyBwb3NzYmlsZSBidXQgcmVxdWlyZXMgY2FyZWZ1bCBkZXNpZ24u
Cj4+Cj4+IEFjdHVhbGx5LCB3ZSBoYWQgYW50b2hlciBvcHRpb24KPj4KPj4gMykgc2hhcmVkIGRv
b3JiZWxsOiBhbGwgdmlydHF1ZXVlIHNoYXJlcyBhIHNpbmdsZSBwYWdlIGFsaWduZWQgZG9vcmJl
bGwKPiBJIGFtIG5vdCBzdXJlIGhvdyB0aGlzIGNvdWxkIHNvbHZlIHRoZSBwcm9ibGVtIG9mIDY0
S0IgYXJjaHMuCj4gVGhlIHBvaW50IGlzIHRoYXQgaW4gQ29ubmVjdFggZGV2aWNlcywgdGhlIHZp
cnRpbyBxdWV1ZSBvYmplY3RzIGRvb3JiZWxsCj4gaXMgYWxpZ25lZCB0byA0Sy4gRm9yIGxhcmdl
ciBzeXN0ZW0gcGFnZSBzaXplcywgdGhlIGRvb3JiZWxsIG1heSBub3QgYmUKPiBhbGlnbmVkIHRv
IGEgc3lzdGVtIHBhZ2UuCj4gU28gaXQgc2VlbXMgbm90IHRvbyBjb21wbGV4IHRvIGludHJvZHVj
ZSBvZmZzZXQgd2l0aGluIHRoZSBwYWdlLgoKClRocmVlIG1ham9yIGlzc3VlczoKCjEpIHNpbmds
ZSBtbWFwKCkgd29ya3MgYXQgcGFnZSBsZXZlbCwgaXQgbWVhbnMgd2UgbmVlZCBtYXAgNjRLIHRv
IGd1ZXN0IAphbmQgd2UgY2FuIG9ubHkgZG8gdGhpcyBzYWZlbHkgaWYgbm8gb3RoZXIgcmVnaXN0
ZXJzIGFyZSBwbGFjZWQgaW50byB0aGUgCnNhbWUgcGFnZQoyKSBuZXcgdUFQSSB0byBsZXQgdGhl
IHVzZXJzcGFjZSBrbm93IHRoZSBvZmZzZXQKMykgaG93IHRvIG1vZGVsIHRoZW0gd2l0aCB0aGUg
dmlydGlvLXBjaSBpbiBRZW11LCBhbmQgdGhpcyBtYXkgaW50cm9kdWNlIApidXJkZW5zIGZvciBt
YW5hZ2VtZW50IChuZWVkIHNvbWUgY2hhbmdlcyBpbiB0aGUgcWVtdSBjb21tYW5kIGxpbmUpIHRv
IApkZWFsIHdpdGggdGhlIG1pZ3JhdGlvbiBjb21wYXRpYmlsaXR5CgpTbyBjb25zaWRlciB0aGUg
Y29tcGxleGl0eSwgd2UgY2FuIGp1c3Qgc3RpY2sgdG8gdGhlIGN1cnJlbnQgY29kZS4gVGhhdCAK
bWVhbnMgbW1hcCgpIHdpbGwgZmFpbCBhbmQgcWVtdSB3aWxsIGtlZXAgdXNpbmcgdGhlIGV2ZW50
ZmQgYmFzZWQga2ljay4KCgo+Cj4gQlRXLCBmb3Igbm93LCBJIGFtIGdvaW5nIHRvIHNlbmQgYW5v
dGhlciBwYXRjaCB0aGF0IG1ha2VzIHN1cmUgcGFnZQo+IGJvdW5kYXJpZXMgYXJlIG5vdCB2aWxh
dGVkLiBJdCByZXF1aXJlcyBzb21lIHN1cHBvcnQgZnJvbSBtbHg1X2NvcmUKPiB3aGljaCBpcyBj
dXJyZW50bHkgYmVpbmcgcmV2aWV3ZWQgaW50ZXJuYWxseS4KCgpTdXJlLgoKVGhhbmtzCgoKPgo+
PiBUaGlzIGlzIG5vdCB5ZXQgc3VwcG9ydGVkIGJ5IFFlbXUuCj4+Cj4+IFRoYW5rcwo+Pgo+Pgo+
Pj4+Pj4gSSBhbHNvIHRoaW5rIHRoYXQgdGhlIGNoZWNrIGluIHZob3N0X3ZkcGFfbW1hcCgpIHNo
b3VsZCB2ZXJpZnkgdGhhdCB0aGUKPj4+Pj4+IHJldHVybmVkIHNpemUgaXMgbm90IHNtYWxsZXIg
dGhhbiBQQUdFX1NJWkUgYmVjYXVzZSB0aGUgcmV0dXJuZWQgYWRkcmVzcwo+Pj4+PiBBY3R1YWxs
eSBJIHRoaW5rIGl0J3Mgb2sgc2luY2UgeW91IHZlcmlmeSB0aGUgc2l6ZSBlcXVhbHMgdm1hLT52
bV9lbmQgLQo+Pj4+PiB2bWEtPnZtX3N0YXJ0IHdoaWNoIG11c3QgYmUgYXQgbGVhc3QgUEFHRV9T
SVpFLgo+Pj4+IFllcy4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4+Cj4+Pj4KPj4+Pj4+IG1pZ2h0IGp1
c3QgYmUgYWxpZ25lZCB0byBQQUdFX1NJWkUuIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgZW5vZ2h0
IGJ1dAo+Pj4+Pj4gbWF5YmUgYWxzbyB1c2UgdGhlIHNhbWUgbG9naWMgaW4gdmhvc3RfdmRwYV9m
YXVsdCgpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
