Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0659F33CE70
	for <lists.virtualization@lfdr.de>; Tue, 16 Mar 2021 08:18:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6179043011;
	Tue, 16 Mar 2021 07:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfvFqiugxqzb; Tue, 16 Mar 2021 07:18:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id E83324301D;
	Tue, 16 Mar 2021 07:18:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88E65C000A;
	Tue, 16 Mar 2021 07:18:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFCE0C000A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 07:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 942304EC0E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 07:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d57Qq4fPqLJO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 07:18:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B836C4EC03
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 07:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615879097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+nZ2biupZA2b8t3bfSDOQuAx/c29kZeRGsgLZwJoPWY=;
 b=hH57PZPWIWEweOlG16ZsxLIx4yWDD0qpdddPjlzq6rIXGN9Nk/bVRI4gMtBw0D0dec5WR6
 WSn3iG4euRL/vmONenLooayvDxEVkA0NYdt9nE/qNnfS+oKkSbkVHz8KD1OJx4GpGx3eb8
 yN4JS8wfQt1qMrH5ekvTFUX5FQTs+yQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-bzZBpGRKNK63nDmqeuoD4g-1; Tue, 16 Mar 2021 03:18:15 -0400
X-MC-Unique: bzZBpGRKNK63nDmqeuoD4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2A40CC626;
 Tue, 16 Mar 2021 07:18:13 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-216.pek2.redhat.com
 [10.72.12.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4651019C46;
 Tue, 16 Mar 2021 07:18:03 +0000 (UTC)
Subject: Re: [RFC v2 05/13] vhost: Route guest->host notification through
 shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <23e492d1-9e86-20d3-e2b3-b3d7c8c6da9c@redhat.com>
Date: Tue, 16 Mar 2021 15:18:02 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315194842.277740-6-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
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

CuWcqCAyMDIxLzMvMTYg5LiK5Y2IMzo0OCwgRXVnZW5pbyBQw6lyZXog5YaZ6YGTOgo+IFNoYWRv
dyB2aXJ0cXVldWUgbm90aWZpY2F0aW9ucyBmb3J3YXJkaW5nIGlzIGRpc2FibGVkIHdoZW4gdmhv
c3RfZGV2Cj4gc3RvcHMsIHNvIGNvZGUgZmxvdyBmb2xsb3dzIHVzdWFsIGNsZWFudXAuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KPiAtLS0K
PiAgIGh3L3ZpcnRpby92aG9zdC1zaGFkb3ctdmlydHF1ZXVlLmggfCAgIDcgKysKPiAgIGluY2x1
ZGUvaHcvdmlydGlvL3Zob3N0LmggICAgICAgICAgfCAgIDQgKwo+ICAgaHcvdmlydGlvL3Zob3N0
LXNoYWRvdy12aXJ0cXVldWUuYyB8IDExMyArKysrKysrKysrKysrKysrKysrKysrLQo+ICAgaHcv
dmlydGlvL3Zob3N0LmMgICAgICAgICAgICAgICAgICB8IDE0MyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyNjUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9ody92aXJ0aW8vdmhvc3Qtc2hhZG93LXZpcnRxdWV1
ZS5oIGIvaHcvdmlydGlvL3Zob3N0LXNoYWRvdy12aXJ0cXVldWUuaAo+IGluZGV4IDZjYzE4ZDZh
Y2IuLmM4OTFjNjUxMGQgMTAwNjQ0Cj4gLS0tIGEvaHcvdmlydGlvL3Zob3N0LXNoYWRvdy12aXJ0
cXVldWUuaAo+ICsrKyBiL2h3L3ZpcnRpby92aG9zdC1zaGFkb3ctdmlydHF1ZXVlLmgKPiBAQCAt
MTcsNiArMTcsMTMgQEAKPiAgIAo+ICAgdHlwZWRlZiBzdHJ1Y3QgVmhvc3RTaGFkb3dWaXJ0cXVl
dWUgVmhvc3RTaGFkb3dWaXJ0cXVldWU7Cj4gICAKPiArYm9vbCB2aG9zdF9zaGFkb3dfdnFfc3Rh
cnQoc3RydWN0IHZob3N0X2RldiAqZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpZHgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIFZob3N0U2hhZG93Vmly
dHF1ZXVlICpzdnEpOwo+ICt2b2lkIHZob3N0X3NoYWRvd192cV9zdG9wKHN0cnVjdCB2aG9zdF9k
ZXYgKmRldiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpZHgsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnN2cSk7Cj4gKwo+
ICAgVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnZob3N0X3NoYWRvd192cV9uZXcoc3RydWN0IHZob3N0
X2RldiAqZGV2LCBpbnQgaWR4KTsKPiAgIAo+ICAgdm9pZCB2aG9zdF9zaGFkb3dfdnFfZnJlZShW
aG9zdFNoYWRvd1ZpcnRxdWV1ZSAqdnEpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3ZpcnRp
by92aG9zdC5oIGIvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QuaAo+IGluZGV4IGFjOTYzYmYyM2Qu
LjdmZmRmOWFlYTAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QuaAo+ICsr
KyBiL2luY2x1ZGUvaHcvdmlydGlvL3Zob3N0LmgKPiBAQCAtNTUsNiArNTUsOCBAQCBzdHJ1Y3Qg
dmhvc3RfaW9tbXUgewo+ICAgICAgIFFMSVNUX0VOVFJZKHZob3N0X2lvbW11KSBpb21tdV9uZXh0
Owo+ICAgfTsKPiAgIAo+ICt0eXBlZGVmIHN0cnVjdCBWaG9zdFNoYWRvd1ZpcnRxdWV1ZSBWaG9z
dFNoYWRvd1ZpcnRxdWV1ZTsKPiArCj4gICB0eXBlZGVmIHN0cnVjdCBWaG9zdERldkNvbmZpZ09w
cyB7Cj4gICAgICAgLyogVmhvc3QgZGV2aWNlIGNvbmZpZyBzcGFjZSBjaGFuZ2VkIGNhbGxiYWNr
Cj4gICAgICAgICovCj4gQEAgLTgzLDcgKzg1LDkgQEAgc3RydWN0IHZob3N0X2RldiB7Cj4gICAg
ICAgdWludDY0X3QgYmFja2VuZF9jYXA7Cj4gICAgICAgYm9vbCBzdGFydGVkOwo+ICAgICAgIGJv
b2wgbG9nX2VuYWJsZWQ7Cj4gKyAgICBib29sIHNoYWRvd192cXNfZW5hYmxlZDsKPiAgICAgICB1
aW50NjRfdCBsb2dfc2l6ZTsKPiArICAgIFZob3N0U2hhZG93VmlydHF1ZXVlICoqc2hhZG93X3Zx
czsKCgpBbnkgcmVhc29uIHRoYXQgeW91IGRvbid0IGVtYmVkIHRoZSBzaGFkb3cgdmlydHF1ZXVl
IGludG8gCnZob3N0X3ZpcnRxdWV1ZSBzdHJ1Y3R1cmU/CgooTm90ZSB0aGF0IHRoZXJlJ3MgYSBt
YXNrZWRfbm90aWZpZXIgaW4gc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSkuCgoKPiAgICAgICBFcnJv
ciAqbWlncmF0aW9uX2Jsb2NrZXI7Cj4gICAgICAgY29uc3QgVmhvc3RPcHMgKnZob3N0X29wczsK
PiAgICAgICB2b2lkICpvcGFxdWU7Cj4gZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92aG9zdC1zaGFk
b3ctdmlydHF1ZXVlLmMgYi9ody92aXJ0aW8vdmhvc3Qtc2hhZG93LXZpcnRxdWV1ZS5jCj4gaW5k
ZXggNDUxMmU1YjA1OC4uM2U0MzM5OWU5YyAxMDA2NDQKPiAtLS0gYS9ody92aXJ0aW8vdmhvc3Qt
c2hhZG93LXZpcnRxdWV1ZS5jCj4gKysrIGIvaHcvdmlydGlvL3Zob3N0LXNoYWRvdy12aXJ0cXVl
dWUuYwo+IEBAIC04LDkgKzgsMTIgQEAKPiAgICAqLwo+ICAgCj4gICAjaW5jbHVkZSAiaHcvdmly
dGlvL3Zob3N0LXNoYWRvdy12aXJ0cXVldWUuaCIKPiArI2luY2x1ZGUgImh3L3ZpcnRpby92aG9z
dC5oIgo+ICsKPiArI2luY2x1ZGUgInN0YW5kYXJkLWhlYWRlcnMvbGludXgvdmhvc3RfdHlwZXMu
aCIKPiAgIAo+ICAgI2luY2x1ZGUgInFlbXUvZXJyb3ItcmVwb3J0LmgiCj4gLSNpbmNsdWRlICJx
ZW11L2V2ZW50X25vdGlmaWVyLmgiCj4gKyNpbmNsdWRlICJxZW11L21haW4tbG9vcC5oIgo+ICAg
Cj4gICAvKiBTaGFkb3cgdmlydHF1ZXVlIHRvIHJlbGF5IG5vdGlmaWNhdGlvbnMgKi8KPiAgIHR5
cGVkZWYgc3RydWN0IFZob3N0U2hhZG93VmlydHF1ZXVlIHsKPiBAQCAtMTgsMTQgKzIxLDEyMSBA
QCB0eXBlZGVmIHN0cnVjdCBWaG9zdFNoYWRvd1ZpcnRxdWV1ZSB7Cj4gICAgICAgRXZlbnROb3Rp
ZmllciBraWNrX25vdGlmaWVyOwo+ICAgICAgIC8qIFNoYWRvdyBjYWxsIG5vdGlmaWVyLCBzZW50
IHRvIHZob3N0ICovCj4gICAgICAgRXZlbnROb3RpZmllciBjYWxsX25vdGlmaWVyOwo+ICsKPiAr
ICAgIC8qCj4gKyAgICAgKiBCb3Jyb3dlZCB2aXJ0cXVldWUncyBndWVzdCB0byBob3N0IG5vdGlm
aWVyLgo+ICsgICAgICogVG8gYm9ycm93IGl0IGluIHRoaXMgZXZlbnQgbm90aWZpZXIgYWxsb3dz
IHRvIHJlZ2lzdGVyIG9uIHRoZSBldmVudAo+ICsgICAgICogbG9vcCBhbmQgYWNjZXNzIHRoZSBh
c3NvY2lhdGVkIHNoYWRvdyB2aXJ0cXVldWUgZWFzaWx5LiBJZiB3ZSB1c2UgdGhlCj4gKyAgICAg
KiBWaXJ0UXVldWUsIHdlIGRvbid0IGhhdmUgYW4gZWFzeSB3YXkgdG8gcmV0cmlldmUgaXQuCgoK
U28gdGhpcyBpcyBzb21ldGhpbmcgdGhhdCB3b3JyaWVzIG1lLiBJdCBsb29rcyBsaWtlIGEgbGF5
ZXIgdmlvbGF0aW9uIAp0aGF0IG1ha2VzIHRoZSBjb2RlcyBoYXJkZXIgdG8gd29yayBjb3JyZWN0
bHkuCgpJIHdvbmRlciBpZiBpdCB3b3VsZCBiZSBzaW1wbGVyIHRvIHN0YXJ0IGZyb20gYSB2RFBB
IGRlZGljYXRlZCBzaGFkb3cgCnZpcnRxdWV1ZSBpbXBsZW1lbnRhdGlvbjoKCjEpIGhhdmUgdGhl
IGFib3ZlIGZpZWxkcyBlbWJlZGVkIGluIHZob3N0X3ZkcGEgc3RydWN0dXJlCjIpIFdvcmsgYXQg
dGhlIGxldmVsIG9mIAp2aG9zdF92ZHBhX3NldF92cmluZ19raWNrKCkvdmhvc3RfdmRwYV9zZXRf
dnJpbmdfY2FsbCgpCgpUaGVuIHRoZSBsYXllciBpcyBzdGlsbCBpc29sYXRlZCBhbmQgeW91IGhh
dmUgYSBtdWNoIHNpbXBsZXIgY29udGV4dCB0byAKd29yayB0aGF0IHlvdSBkb24ndCBuZWVkIHRv
IGNhcmUgYSBsb3Qgb2Ygc3luY2hvcm5pemF0aW9uOgoKMSkgdnEgbWFza2luZwoyKSB2aG9zdCBk
ZXYgc3RhcnQgYW5kIHN0b3AKCj8KCgo+ICsgICAgICoKPiArICAgICAqIFNvIHNoYWRvdyB2aXJ0
cXVldWUgbXVzdCBub3QgY2xlYW4gaXQsIG9yIHdlIHdvdWxkIGxvc2UgVmlydFF1ZXVlIG9uZS4K
PiArICAgICAqLwo+ICsgICAgRXZlbnROb3RpZmllciBob3N0X25vdGlmaWVyOwo+ICsKPiArICAg
IC8qIFZpcnRpbyBxdWV1ZSBzaGFkb3dpbmcgKi8KPiArICAgIFZpcnRRdWV1ZSAqdnE7Cj4gICB9
IFZob3N0U2hhZG93VmlydHF1ZXVlOwo+ICAgCj4gKy8qIEZvcndhcmQgZ3Vlc3Qgbm90aWZpY2F0
aW9ucyAqLwo+ICtzdGF0aWMgdm9pZCB2aG9zdF9oYW5kbGVfZ3Vlc3Rfa2ljayhFdmVudE5vdGlm
aWVyICpuKQo+ICt7Cj4gKyAgICBWaG9zdFNoYWRvd1ZpcnRxdWV1ZSAqc3ZxID0gY29udGFpbmVy
X29mKG4sIFZob3N0U2hhZG93VmlydHF1ZXVlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBob3N0X25vdGlmaWVyKTsKPiArCj4gKyAgICBpZiAodW5saWtl
bHkoIWV2ZW50X25vdGlmaWVyX3Rlc3RfYW5kX2NsZWFyKG4pKSkgewo+ICsgICAgICAgIHJldHVy
bjsKPiArICAgIH0KPiArCj4gKyAgICBldmVudF9ub3RpZmllcl9zZXQoJnN2cS0+a2lja19ub3Rp
Zmllcik7Cj4gK30KPiArCj4gKy8qCj4gKyAqIFJlc3RvcmUgdGhlIHZob3N0IGd1ZXN0IHRvIGhv
c3Qgbm90aWZpZXIsIGkuZS4sIGRpc2FibGVzIHN2cSBlZmZlY3QuCj4gKyAqLwo+ICtzdGF0aWMg
aW50IHZob3N0X3NoYWRvd192cV9yZXN0b3JlX3ZkZXZfaG9zdF9ub3RpZmllcihzdHJ1Y3Qgdmhv
c3RfZGV2ICpkZXYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgdmhvc3RfaW5kZXgsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnN2
cSkKPiArewo+ICsgICAgRXZlbnROb3RpZmllciAqdnFfaG9zdF9ub3RpZmllciA9IHZpcnRpb19x
dWV1ZV9nZXRfaG9zdF9ub3RpZmllcihzdnEtPnZxKTsKPiArICAgIHN0cnVjdCB2aG9zdF92cmlu
Z19maWxlIGZpbGUgPSB7Cj4gKyAgICAgICAgLmluZGV4ID0gdmhvc3RfaW5kZXgsCj4gKyAgICAg
ICAgLmZkID0gZXZlbnRfbm90aWZpZXJfZ2V0X2ZkKHZxX2hvc3Rfbm90aWZpZXIpLAo+ICsgICAg
fTsKPiArICAgIGludCByOwo+ICsKPiArICAgIC8qIFJlc3RvcmUgdmhvc3Qga2ljayAqLwo+ICsg
ICAgciA9IGRldi0+dmhvc3Rfb3BzLT52aG9zdF9zZXRfdnJpbmdfa2ljayhkZXYsICZmaWxlKTsK
PiArICAgIHJldHVybiByID8gLWVycm5vIDogMDsKPiArfQo+ICsKPiArLyoKPiArICogU3RhcnQg
c2hhZG93IHZpcnRxdWV1ZSBvcGVyYXRpb24uCj4gKyAqIEBkZXYgdmhvc3QgZGV2aWNlCj4gKyAq
IEBoaWR4IHZob3N0IHZpcnRxdWV1ZSBpbmRleAo+ICsgKiBAc3ZxIFNoYWRvdyBWaXJ0cXVldWUK
PiArICovCj4gK2Jvb2wgdmhvc3Rfc2hhZG93X3ZxX3N0YXJ0KHN0cnVjdCB2aG9zdF9kZXYgKmRl
diwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaWR4LAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICBWaG9zdFNoYWRvd1ZpcnRxdWV1ZSAqc3ZxKQoKCkl0IGxvb2tz
IHRvIG1lIHRoaXMgYXNzdW1lcyB0aGUgdmhvc3RfZGV2IGlzIHN0YXJ0ZWQgYmVmb3JlIAp2aG9z
dF9zaGFkb3dfdnFfc3RhcnQoKT8KCgo+ICt7Cj4gKyAgICBFdmVudE5vdGlmaWVyICp2cV9ob3N0
X25vdGlmaWVyID0gdmlydGlvX3F1ZXVlX2dldF9ob3N0X25vdGlmaWVyKHN2cS0+dnEpOwo+ICsg
ICAgc3RydWN0IHZob3N0X3ZyaW5nX2ZpbGUgZmlsZSA9IHsKPiArICAgICAgICAuaW5kZXggPSBp
ZHgsCj4gKyAgICAgICAgLmZkID0gZXZlbnRfbm90aWZpZXJfZ2V0X2ZkKCZzdnEtPmtpY2tfbm90
aWZpZXIpLAo+ICsgICAgfTsKPiArICAgIGludCByOwo+ICsKPiArICAgIC8qIENoZWNrIHRoYXQg
bm90aWZpY2F0aW9ucyBhcmUgc3RpbGwgZ29pbmcgZGlyZWN0bHkgdG8gdmhvc3QgZGV2ICovCj4g
KyAgICBhc3NlcnQodmlydGlvX3F1ZXVlX2lzX2hvc3Rfbm90aWZpZXJfZW5hYmxlZChzdnEtPnZx
KSk7Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIGV2ZW50X25vdGlmaWVyX3NldF9oYW5kbGVyIGFs
cmVhZHkgY2hlY2tzIGZvciBndWVzdCdzIG5vdGlmaWNhdGlvbnMgaWYKPiArICAgICAqIHRoZXkg
YXJyaXZlIGluIHRoZSBzd2l0Y2gsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gZXhwbGljaXRlbHkg
Y2hlY2sgZm9yCj4gKyAgICAgKiB0aGVtLgo+ICsgICAgICovCj4gKyAgICBldmVudF9ub3RpZmll
cl9pbml0X2ZkKCZzdnEtPmhvc3Rfbm90aWZpZXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGV2ZW50X25vdGlmaWVyX2dldF9mZCh2cV9ob3N0X25vdGlmaWVyKSk7Cj4gKyAgICBldmVu
dF9ub3RpZmllcl9zZXRfaGFuZGxlcigmc3ZxLT5ob3N0X25vdGlmaWVyLCB2aG9zdF9oYW5kbGVf
Z3Vlc3Rfa2ljayk7Cj4gKwo+ICsgICAgciA9IGRldi0+dmhvc3Rfb3BzLT52aG9zdF9zZXRfdnJp
bmdfa2ljayhkZXYsICZmaWxlKTsKPiArICAgIGlmICh1bmxpa2VseShyICE9IDApKSB7Cj4gKyAg
ICAgICAgZXJyb3JfcmVwb3J0KCJDb3VsZG4ndCBzZXQga2ljayBmZDogJXMiLCBzdHJlcnJvcihl
cnJubykpOwo+ICsgICAgICAgIGdvdG8gZXJyX3NldF92cmluZ19raWNrOwo+ICsgICAgfQo+ICsK
PiArICAgIHJldHVybiB0cnVlOwo+ICsKPiArZXJyX3NldF92cmluZ19raWNrOgo+ICsgICAgZXZl
bnRfbm90aWZpZXJfc2V0X2hhbmRsZXIoJnN2cS0+aG9zdF9ub3RpZmllciwgTlVMTCk7Cj4gKwo+
ICsgICAgcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBTdG9wIHNoYWRvdyB2aXJ0
cXVldWUgb3BlcmF0aW9uLgo+ICsgKiBAZGV2IHZob3N0IGRldmljZQo+ICsgKiBAaWR4IHZob3N0
IHF1ZXVlIGluZGV4Cj4gKyAqIEBzdnEgU2hhZG93IFZpcnRxdWV1ZQo+ICsgKi8KPiArdm9pZCB2
aG9zdF9zaGFkb3dfdnFfc3RvcChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgaWR4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
IFZob3N0U2hhZG93VmlydHF1ZXVlICpzdnEpCj4gK3sKPiArICAgIGludCByID0gdmhvc3Rfc2hh
ZG93X3ZxX3Jlc3RvcmVfdmRldl9ob3N0X25vdGlmaWVyKGRldiwgaWR4LCBzdnEpOwo+ICsgICAg
aWYgKHVubGlrZWx5KHIgPCAwKSkgewo+ICsgICAgICAgIGVycm9yX3JlcG9ydCgiQ291bGRuJ3Qg
cmVzdG9yZSB2cSBraWNrIGZkOiAlcyIsIHN0cmVycm9yKC1yKSk7Cj4gKyAgICB9Cj4gKwo+ICsg
ICAgZXZlbnRfbm90aWZpZXJfc2V0X2hhbmRsZXIoJnN2cS0+aG9zdF9ub3RpZmllciwgTlVMTCk7
Cj4gK30KPiArCj4gICAvKgo+ICAgICogQ3JlYXRlcyB2aG9zdCBzaGFkb3cgdmlydHF1ZXVlLCBh
bmQgaW5zdHJ1Y3Qgdmhvc3QgZGV2aWNlIHRvIHVzZSB0aGUgc2hhZG93Cj4gICAgKiBtZXRob2Rz
IGFuZCBmaWxlIGRlc2NyaXB0b3JzLgo+ICAgICovCj4gICBWaG9zdFNoYWRvd1ZpcnRxdWV1ZSAq
dmhvc3Rfc2hhZG93X3ZxX25ldyhzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsIGludCBpZHgpCj4gICB7
Cj4gKyAgICBpbnQgdnFfaWR4ID0gZGV2LT52cV9pbmRleCArIGlkeDsKPiAgICAgICBnX2F1dG9m
cmVlIFZob3N0U2hhZG93VmlydHF1ZXVlICpzdnEgPSBnX25ldzAoVmhvc3RTaGFkb3dWaXJ0cXVl
dWUsIDEpOwo+ICAgICAgIGludCByOwo+ICAgCj4gQEAgLTQzLDYgKzE1Myw3IEBAIFZob3N0U2hh
ZG93VmlydHF1ZXVlICp2aG9zdF9zaGFkb3dfdnFfbmV3KHN0cnVjdCB2aG9zdF9kZXYgKmRldiwg
aW50IGlkeCkKPiAgICAgICAgICAgZ290byBlcnJfaW5pdF9jYWxsX25vdGlmaWVyOwo+ICAgICAg
IH0KPiAgIAo+ICsgICAgc3ZxLT52cSA9IHZpcnRpb19nZXRfcXVldWUoZGV2LT52ZGV2LCB2cV9p
ZHgpOwo+ICAgICAgIHJldHVybiBnX3N0ZWFsX3BvaW50ZXIoJnN2cSk7Cj4gICAKPiAgIGVycl9p
bml0X2NhbGxfbm90aWZpZXI6Cj4gZGlmZiAtLWdpdCBhL2h3L3ZpcnRpby92aG9zdC5jIGIvaHcv
dmlydGlvL3Zob3N0LmMKPiBpbmRleCA5N2YxYmNmYTQyLi40ODU4YTM1ZGY2IDEwMDY0NAo+IC0t
LSBhL2h3L3ZpcnRpby92aG9zdC5jCj4gKysrIGIvaHcvdmlydGlvL3Zob3N0LmMKPiBAQCAtMjUs
NiArMjUsNyBAQAo+ICAgI2luY2x1ZGUgImV4ZWMvYWRkcmVzcy1zcGFjZXMuaCIKPiAgICNpbmNs
dWRlICJody92aXJ0aW8vdmlydGlvLWJ1cy5oIgo+ICAgI2luY2x1ZGUgImh3L3ZpcnRpby92aXJ0
aW8tYWNjZXNzLmgiCj4gKyNpbmNsdWRlICJody92aXJ0aW8vdmhvc3Qtc2hhZG93LXZpcnRxdWV1
ZS5oIgo+ICAgI2luY2x1ZGUgIm1pZ3JhdGlvbi9ibG9ja2VyLmgiCj4gICAjaW5jbHVkZSAibWln
cmF0aW9uL3FlbXUtZmlsZS10eXBlcy5oIgo+ICAgI2luY2x1ZGUgInN5c2VtdS9kbWEuaCIKPiBA
QCAtMTIxOSw2ICsxMjIwLDc0IEBAIHN0YXRpYyB2b2lkIHZob3N0X3ZpcnRxdWV1ZV9zdG9wKHN0
cnVjdCB2aG9zdF9kZXYgKmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgdmlydGlv
X3F1ZXVlX2dldF9kZXNjX3NpemUodmRldiwgaWR4KSk7Cj4gICB9Cj4gICAKPiArc3RhdGljIGlu
dCB2aG9zdF9zd19saXZlX21pZ3JhdGlvbl9zdG9wKHN0cnVjdCB2aG9zdF9kZXYgKmRldikKPiAr
ewo+ICsgICAgaW50IGlkeDsKPiArCj4gKyAgICBkZXYtPnNoYWRvd192cXNfZW5hYmxlZCA9IGZh
bHNlOwo+ICsKPiArICAgIGZvciAoaWR4ID0gMDsgaWR4IDwgZGV2LT5udnFzOyArK2lkeCkgewo+
ICsgICAgICAgIHZob3N0X3NoYWRvd192cV9zdG9wKGRldiwgaWR4LCBkZXYtPnNoYWRvd192cXNb
aWR4XSk7Cj4gKyAgICAgICAgdmhvc3Rfc2hhZG93X3ZxX2ZyZWUoZGV2LT5zaGFkb3dfdnFzW2lk
eF0pOwo+ICsgICAgfQo+ICsKPiArICAgIGdfZnJlZShkZXYtPnNoYWRvd192cXMpOwo+ICsgICAg
ZGV2LT5zaGFkb3dfdnFzID0gTlVMTDsKPiArICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0
aWMgaW50IHZob3N0X3N3X2xpdmVfbWlncmF0aW9uX3N0YXJ0KHN0cnVjdCB2aG9zdF9kZXYgKmRl
dikKPiArewo+ICsgICAgaW50IGlkeCwgc3RvcF9pZHg7Cj4gKwo+ICsgICAgZGV2LT5zaGFkb3df
dnFzID0gZ19uZXcwKFZob3N0U2hhZG93VmlydHF1ZXVlICosIGRldi0+bnZxcyk7Cj4gKyAgICBm
b3IgKGlkeCA9IDA7IGlkeCA8IGRldi0+bnZxczsgKytpZHgpIHsKPiArICAgICAgICBkZXYtPnNo
YWRvd192cXNbaWR4XSA9IHZob3N0X3NoYWRvd192cV9uZXcoZGV2LCBpZHgpOwo+ICsgICAgICAg
IGlmICh1bmxpa2VseShkZXYtPnNoYWRvd192cXNbaWR4XSA9PSBOVUxMKSkgewo+ICsgICAgICAg
ICAgICBnb3RvIGVycl9uZXc7Cj4gKyAgICAgICAgfQo+ICsgICAgfQo+ICsKPiArICAgIGRldi0+
c2hhZG93X3Zxc19lbmFibGVkID0gdHJ1ZTsKPiArICAgIGZvciAoaWR4ID0gMDsgaWR4IDwgZGV2
LT5udnFzOyArK2lkeCkgewo+ICsgICAgICAgIGJvb2wgb2sgPSB2aG9zdF9zaGFkb3dfdnFfc3Rh
cnQoZGV2LCBpZHgsIGRldi0+c2hhZG93X3Zxc1tpZHhdKTsKPiArICAgICAgICBpZiAodW5saWtl
bHkoIW9rKSkgewo+ICsgICAgICAgICAgICBnb3RvIGVycl9zdGFydDsKPiArICAgICAgICB9Cj4g
KyAgICB9Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gKwo+ICtlcnJfc3RhcnQ6Cj4gKyAgICBkZXYt
PnNoYWRvd192cXNfZW5hYmxlZCA9IGZhbHNlOwo+ICsgICAgZm9yIChzdG9wX2lkeCA9IDA7IHN0
b3BfaWR4IDwgaWR4OyBzdG9wX2lkeCsrKSB7Cj4gKyAgICAgICAgdmhvc3Rfc2hhZG93X3ZxX3N0
b3AoZGV2LCBpZHgsIGRldi0+c2hhZG93X3Zxc1tzdG9wX2lkeF0pOwo+ICsgICAgfQo+ICsKPiAr
ZXJyX25ldzoKPiArICAgIGZvciAoaWR4ID0gMDsgaWR4IDwgZGV2LT5udnFzOyArK2lkeCkgewo+
ICsgICAgICAgIHZob3N0X3NoYWRvd192cV9mcmVlKGRldi0+c2hhZG93X3Zxc1tpZHhdKTsKPiAr
ICAgIH0KPiArICAgIGdfZnJlZShkZXYtPnNoYWRvd192cXMpOwo+ICsKPiArICAgIHJldHVybiAt
MTsKPiArfQo+ICsKPiArc3RhdGljIGludCB2aG9zdF9zd19saXZlX21pZ3JhdGlvbl9lbmFibGUo
c3RydWN0IHZob3N0X2RldiAqZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBib29sIGVuYWJsZV9sbSkKPiArewoKClNvIHRoZSBsaXZlIG1pZ3JhdGlvbiBw
YXJ0IHNob3VsZCBiZSBkb25lIGluIGFuIHNlcGFydGVkIHBhdGNoLgoKVGhhbmtzCgoKPiArICAg
IGludCByOwo+ICsKPiArICAgIGlmIChlbmFibGVfbG0gPT0gZGV2LT5zaGFkb3dfdnFzX2VuYWJs
ZWQpIHsKPiArICAgICAgICByZXR1cm4gMDsKPiArICAgIH0KPiArCj4gKyAgICByID0gZW5hYmxl
X2xtID8gdmhvc3Rfc3dfbGl2ZV9taWdyYXRpb25fc3RhcnQoZGV2KQo+ICsgICAgICAgICAgICAg
ICAgICA6IHZob3N0X3N3X2xpdmVfbWlncmF0aW9uX3N0b3AoZGV2KTsKPiArCj4gKyAgICByZXR1
cm4gcjsKPiArfQo+ICsKPiAgIHN0YXRpYyB2b2lkIHZob3N0X2V2ZW50ZmRfYWRkKE1lbW9yeUxp
c3RlbmVyICpsaXN0ZW5lciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1lbW9y
eVJlZ2lvblNlY3Rpb24gKnNlY3Rpb24sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIG1hdGNoX2RhdGEsIHVpbnQ2NF90IGRhdGEsIEV2ZW50Tm90aWZpZXIgKmUpCj4gQEAg
LTEzODEsNiArMTQ1MCw3IEBAIGludCB2aG9zdF9kZXZfaW5pdChzdHJ1Y3Qgdmhvc3RfZGV2ICpo
ZGV2LCB2b2lkICpvcGFxdWUsCj4gICAgICAgaGRldi0+bG9nID0gTlVMTDsKPiAgICAgICBoZGV2
LT5sb2dfc2l6ZSA9IDA7Cj4gICAgICAgaGRldi0+bG9nX2VuYWJsZWQgPSBmYWxzZTsKPiArICAg
IGhkZXYtPnNoYWRvd192cXNfZW5hYmxlZCA9IGZhbHNlOwo+ICAgICAgIGhkZXYtPnN0YXJ0ZWQg
PSBmYWxzZTsKPiAgICAgICBtZW1vcnlfbGlzdGVuZXJfcmVnaXN0ZXIoJmhkZXYtPm1lbW9yeV9s
aXN0ZW5lciwgJmFkZHJlc3Nfc3BhY2VfbWVtb3J5KTsKPiAgICAgICBRTElTVF9JTlNFUlRfSEVB
RCgmdmhvc3RfZGV2aWNlcywgaGRldiwgZW50cnkpOwo+IEBAIC0xNDg0LDYgKzE1NTQsMTAgQEAg
dm9pZCB2aG9zdF9kZXZfZGlzYWJsZV9ub3RpZmllcnMoc3RydWN0IHZob3N0X2RldiAqaGRldiwg
VmlydElPRGV2aWNlICp2ZGV2KQo+ICAgICAgIEJ1c1N0YXRlICpxYnVzID0gQlVTKHFkZXZfZ2V0
X3BhcmVudF9idXMoREVWSUNFKHZkZXYpKSk7Cj4gICAgICAgaW50IGksIHI7Cj4gICAKPiArICAg
IGlmIChoZGV2LT5zaGFkb3dfdnFzX2VuYWJsZWQpIHsKPiArICAgICAgICB2aG9zdF9zd19saXZl
X21pZ3JhdGlvbl9lbmFibGUoaGRldiwgZmFsc2UpOwo+ICsgICAgfQo+ICsKPiAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgaGRldi0+bnZxczsgKytpKSB7Cj4gICAgICAgICAgIHIgPSB2aXJ0aW9fYnVz
X3NldF9ob3N0X25vdGlmaWVyKFZJUlRJT19CVVMocWJ1cyksIGhkZXYtPnZxX2luZGV4ICsgaSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFsc2UpOwo+IEBA
IC0xNzk4LDYgKzE4NzIsNyBAQCBmYWlsX2ZlYXR1cmVzOgo+ICAgdm9pZCB2aG9zdF9kZXZfc3Rv
cChzdHJ1Y3Qgdmhvc3RfZGV2ICpoZGV2LCBWaXJ0SU9EZXZpY2UgKnZkZXYpCj4gICB7Cj4gICAg
ICAgaW50IGk7Cj4gKyAgICBib29sIGlzX3NoYWRvd192cXNfZW5hYmxlZCA9IGhkZXYtPnNoYWRv
d192cXNfZW5hYmxlZDsKPiAgIAo+ICAgICAgIC8qIHNob3VsZCBvbmx5IGJlIGNhbGxlZCBhZnRl
ciBiYWNrZW5kIGlzIGNvbm5lY3RlZCAqLwo+ICAgICAgIGFzc2VydChoZGV2LT52aG9zdF9vcHMp
Owo+IEBAIC0xODA1LDcgKzE4ODAsMTYgQEAgdm9pZCB2aG9zdF9kZXZfc3RvcChzdHJ1Y3Qgdmhv
c3RfZGV2ICpoZGV2LCBWaXJ0SU9EZXZpY2UgKnZkZXYpCj4gICAgICAgaWYgKGhkZXYtPnZob3N0
X29wcy0+dmhvc3RfZGV2X3N0YXJ0KSB7Cj4gICAgICAgICAgIGhkZXYtPnZob3N0X29wcy0+dmhv
c3RfZGV2X3N0YXJ0KGhkZXYsIGZhbHNlKTsKPiAgICAgICB9Cj4gKyAgICBpZiAoaXNfc2hhZG93
X3Zxc19lbmFibGVkKSB7Cj4gKyAgICAgICAgLyogU2hhZG93IHZpcnRxdWV1ZSB3aWxsIGJlIHN0
b3BwZWQgKi8KPiArICAgICAgICBoZGV2LT5zaGFkb3dfdnFzX2VuYWJsZWQgPSBmYWxzZTsKPiAr
ICAgIH0KPiAgICAgICBmb3IgKGkgPSAwOyBpIDwgaGRldi0+bnZxczsgKytpKSB7Cj4gKyAgICAg
ICAgaWYgKGlzX3NoYWRvd192cXNfZW5hYmxlZCkgewo+ICsgICAgICAgICAgICB2aG9zdF9zaGFk
b3dfdnFfc3RvcChoZGV2LCBpLCBoZGV2LT5zaGFkb3dfdnFzW2ldKTsKPiArICAgICAgICAgICAg
dmhvc3Rfc2hhZG93X3ZxX2ZyZWUoaGRldi0+c2hhZG93X3Zxc1tpXSk7Cj4gKyAgICAgICAgfQo+
ICsKPiAgICAgICAgICAgdmhvc3RfdmlydHF1ZXVlX3N0b3AoaGRldiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aGRldi0+dnFzICsgaSwKPiBAQCAtMTgxOSw2ICsxOTAzLDggQEAgdm9pZCB2aG9zdF9kZXZfc3Rv
cChzdHJ1Y3Qgdmhvc3RfZGV2ICpoZGV2LCBWaXJ0SU9EZXZpY2UgKnZkZXYpCj4gICAgICAgICAg
IG1lbW9yeV9saXN0ZW5lcl91bnJlZ2lzdGVyKCZoZGV2LT5pb21tdV9saXN0ZW5lcik7Cj4gICAg
ICAgfQo+ICAgICAgIHZob3N0X2xvZ19wdXQoaGRldiwgdHJ1ZSk7Cj4gKyAgICBnX2ZyZWUoaGRl
di0+c2hhZG93X3Zxcyk7Cj4gKyAgICBoZGV2LT5zaGFkb3dfdnFzX2VuYWJsZWQgPSBmYWxzZTsK
PiAgICAgICBoZGV2LT5zdGFydGVkID0gZmFsc2U7Cj4gICAgICAgaGRldi0+dmRldiA9IE5VTEw7
Cj4gICB9Cj4gQEAgLTE4MzUsNSArMTkyMSw2MCBAQCBpbnQgdmhvc3RfbmV0X3NldF9iYWNrZW5k
KHN0cnVjdCB2aG9zdF9kZXYgKmhkZXYsCj4gICAKPiAgIHZvaWQgcW1wX3hfdmhvc3RfZW5hYmxl
X3NoYWRvd192cShjb25zdCBjaGFyICpuYW1lLCBib29sIGVuYWJsZSwgRXJyb3IgKiplcnJwKQo+
ICAgewo+IC0gICAgZXJyb3Jfc2V0ZyhlcnJwLCAiU2hhZG93IHZpcnRxdWV1ZSBzdGlsbCBub3Qg
aW1wbGVtZW50ZWQiKTsKPiArICAgIHN0cnVjdCB2aG9zdF9kZXYgKmhkZXYsICpoZGV2X2VycjsK
PiArICAgIFZpcnRJT0RldmljZSAqdmRldjsKPiArICAgIGNvbnN0IGNoYXIgKmVycl9jYXVzZSA9
IE5VTEw7Cj4gKyAgICBpbnQgcjsKPiArICAgIEVycm9yQ2xhc3MgZXJyX2NsYXNzID0gRVJST1Jf
Q0xBU1NfR0VORVJJQ19FUlJPUjsKPiArCj4gKyAgICBRTElTVF9GT1JFQUNIKGhkZXYsICZ2aG9z
dF9kZXZpY2VzLCBlbnRyeSkgewo+ICsgICAgICAgIGlmIChoZGV2LT52ZGV2ICYmIDAgPT0gc3Ry
Y21wKGhkZXYtPnZkZXYtPm5hbWUsIG5hbWUpKSB7Cj4gKyAgICAgICAgICAgIHZkZXYgPSBoZGV2
LT52ZGV2Owo+ICsgICAgICAgICAgICBicmVhazsKPiArICAgICAgICB9Cj4gKyAgICB9Cj4gKwo+
ICsgICAgaWYgKCFoZGV2KSB7Cj4gKyAgICAgICAgZXJyX2NsYXNzID0gRVJST1JfQ0xBU1NfREVW
SUNFX05PVF9GT1VORDsKPiArICAgICAgICBlcnJfY2F1c2UgPSAiRGV2aWNlIG5vdCBmb3VuZCI7
Cj4gKyAgICAgICAgZ290byBub3RfZm91bmRfZXJyOwo+ICsgICAgfQo+ICsKPiArICAgIGZvciAo
IDsgaGRldjsgaGRldiA9IFFMSVNUX05FWFQoaGRldiwgZW50cnkpKSB7Cj4gKyAgICAgICAgaWYg
KHZkZXYgIT0gaGRldi0+dmRldikgewo+ICsgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAg
ICB9Cj4gKwo+ICsgICAgICAgIGlmICghaGRldi0+c3RhcnRlZCkgewo+ICsgICAgICAgICAgICBl
cnJfY2F1c2UgPSAiRGV2aWNlIGlzIG5vdCBzdGFydGVkIjsKPiArICAgICAgICAgICAgZ290byBl
cnI7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICByID0gdmhvc3Rfc3dfbGl2ZV9taWdyYXRp
b25fZW5hYmxlKGhkZXYsIGVuYWJsZSk7Cj4gKyAgICAgICAgaWYgKHVubGlrZWx5KHIpKSB7Cj4g
KyAgICAgICAgICAgIGVycl9jYXVzZSA9ICJFcnJvciBlbmFibGluZyAoc2VlIG1vbml0b3IpIjsK
PiArICAgICAgICAgICAgZ290byBlcnI7Cj4gKyAgICAgICAgfQo+ICsgICAgfQo+ICsKPiArICAg
IHJldHVybjsKPiArCj4gK2VycjoKPiArICAgIFFMSVNUX0ZPUkVBQ0goaGRldl9lcnIsICZ2aG9z
dF9kZXZpY2VzLCBlbnRyeSkgewo+ICsgICAgICAgIGlmIChoZGV2X2VyciA9PSBoZGV2KSB7Cj4g
KyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIH0KPiArCj4gKyAgICAgICAgaWYgKHZkZXYg
IT0gaGRldi0+dmRldikgewo+ICsgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICB9Cj4g
Kwo+ICsgICAgICAgIHZob3N0X3N3X2xpdmVfbWlncmF0aW9uX2VuYWJsZShoZGV2LCAhZW5hYmxl
KTsKPiArICAgIH0KPiArCj4gK25vdF9mb3VuZF9lcnI6Cj4gKyAgICBpZiAoZXJyX2NhdXNlKSB7
Cj4gKyAgICAgICAgZXJyb3Jfc2V0KGVycnAsIGVycl9jbGFzcywKPiArICAgICAgICAgICAgICAg
ICAgIkNhbid0IGVuYWJsZSBzaGFkb3cgdnEgb24gJXM6ICVzIiwgbmFtZSwgZXJyX2NhdXNlKTsK
PiArICAgIH0KPiAgIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
