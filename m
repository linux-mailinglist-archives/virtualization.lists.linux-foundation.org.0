Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 23840E2F46
	for <lists.virtualization@lfdr.de>; Thu, 24 Oct 2019 12:43:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4920B1533;
	Thu, 24 Oct 2019 10:43:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52D14B79
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 10:43:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 98B8F8C1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 10:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571913788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=4wI1HwBUjiSqLG+R/qGHQwon1lbGfQ/yWCz8YkSyTFo=;
	b=SsNVKHf0STNsRllpE3uews91kXeO+m2YErx8SWF1opbhg0JwtfvebLrIi2yR/yyp+xTUEO
	orN7sP2AoKVeBOqrKIdktBPz1qY/bWVzQN62JXbwPnpVAmpEEDTT48ODOXtM5Dgq+hfgSe
	SwCovpddee2a62AZbXxX1BaQMfR2qYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-RTDyQiFIPI60gnHRQ8FavA-1; Thu, 24 Oct 2019 06:43:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDA801800DFB;
	Thu, 24 Oct 2019 10:43:03 +0000 (UTC)
Received: from [10.72.13.32] (ovpn-13-32.pek2.redhat.com [10.72.13.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B3701001B2B;
	Thu, 24 Oct 2019 10:42:52 +0000 (UTC)
Subject: Re: [PATCH v2] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <47a572fd-5597-1972-e177-8ee25ca51247@redhat.com>
	<20191023030253.GA15401@___>
	<ac36f1e3-b972-71ac-fe0c-3db03e016dcf@redhat.com>
	<20191023070747.GA30533@___>
	<106834b5-dae5-82b2-0f97-16951709d075@redhat.com>
	<20191023101135.GA6367@___>
	<5a7bc5da-d501-2750-90bf-545dd55f85fa@redhat.com>
	<20191024042155.GA21090@___>
	<d37529e1-5147-bbe5-cb9d-299bd6d4aa1a@redhat.com>
	<d4cc4f4e-2635-4041-2f68-cd043a97f25a@redhat.com>
	<20191024091839.GA17463@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fefc82a3-a137-bc03-e1c3-8de79b238080@redhat.com>
Date: Thu, 24 Oct 2019 18:42:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191024091839.GA17463@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: RTDyQiFIPI60gnHRQ8FavA-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTAvMjQg5LiL5Y2INToxOCwgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIFRodSwgT2N0
IDI0LCAyMDE5IGF0IDA0OjMyOjQyUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIw
MTkvMTAvMjQg5LiL5Y2INDowMywgSmFzb24gV2FuZyB3cm90ZToKPj4+IE9uIDIwMTkvMTAvMjQg
5LiL5Y2IMTI6MjEsIFRpd2VpIEJpZSB3cm90ZToKPj4+PiBPbiBXZWQsIE9jdCAyMywgMjAxOSBh
dCAwNjoyOToyMVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+PiBPbiAyMDE5LzEwLzIz
IOS4i+WNiDY6MTEsIFRpd2VpIEJpZSB3cm90ZToKPj4+Pj4+IE9uIFdlZCwgT2N0IDIzLCAyMDE5
IGF0IDAzOjI1OjAwUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4gT24gMjAxOS8x
MC8yMyDkuIvljYgzOjA3LCBUaXdlaSBCaWUgd3JvdGU6Cj4+Pj4+Pj4+IE9uIFdlZCwgT2N0IDIz
LCAyMDE5IGF0IDAxOjQ2OjIzUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4+PiBP
biAyMDE5LzEwLzIzIOS4iuWNiDExOjAyLCBUaXdlaSBCaWUgd3JvdGU6Cj4+Pj4+Pj4+Pj4gT24g
VHVlLCBPY3QgMjIsIDIwMTkgYXQgMDk6MzA6MTZQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4+Pj4+Pj4+Pj4gT24gMjAxOS8xMC8yMiDkuIvljYg1OjUyLCBUaXdlaSBCaWUgd3JvdGU6Cj4+
Pj4+Pj4+Pj4+PiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBtZGV2IGJhc2VkIGhhcmR3YXJlIHZo
b3N0IGJhY2tlbmQuCj4+Pj4+Pj4+Pj4+PiBUaGlzIGJhY2tlbmQgaXMgYnVpbHQgb24gdG9wIG9m
IHRoZSBzYW1lIGFic3RyYWN0aW9uIHVzZWQKPj4+Pj4+Pj4+Pj4+IGluIHZpcnRpby1tZGV2IGFu
ZCBwcm92aWRlcyBhIGdlbmVyaWMgdmhvc3QgaW50ZXJmYWNlIGZvcgo+Pj4+Pj4+Pj4+Pj4gdXNl
cnNwYWNlIHRvIGFjY2VsZXJhdGUgdGhlIHZpcnRpbyBkZXZpY2VzIGluIGd1ZXN0Lgo+Pj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFRoaXMgYmFja2VuZCBpcyBpbXBsZW1lbnRlZCBhcyBhIG1kZXYg
ZGV2aWNlIGRyaXZlciBvbiB0b3AKPj4+Pj4+Pj4+Pj4+IG9mIHRoZSBzYW1lIG1kZXYgZGV2aWNl
IG9wcyB1c2VkIGluIHZpcnRpby1tZGV2IGJ1dCB1c2luZwo+Pj4+Pj4+Pj4+Pj4gYSBkaWZmZXJl
bnQgbWRldiBjbGFzcyBpZCwgYW5kIGl0IHdpbGwgcmVnaXN0ZXIgdGhlIGRldmljZQo+Pj4+Pj4+
Pj4+Pj4gYXMgYSBWRklPIGRldmljZSBmb3IgdXNlcnNwYWNlIHRvIHVzZS4gVXNlcnNwYWNlIGNh
biBzZXR1cAo+Pj4+Pj4+Pj4+Pj4gdGhlIElPTU1VIHdpdGggdGhlIGV4aXN0aW5nIFZGSU8gY29u
dGFpbmVyL2dyb3VwIEFQSXMgYW5kCj4+Pj4+Pj4+Pj4+PiB0aGVuIGdldCB0aGUgZGV2aWNlIGZk
IHdpdGggdGhlIGRldmljZSBuYW1lLiBBZnRlciBnZXR0aW5nCj4+Pj4+Pj4+Pj4+PiB0aGUgZGV2
aWNlIGZkIG9mIHRoaXMgZGV2aWNlLCB1c2Vyc3BhY2UgY2FuIHVzZSB2aG9zdCBpb2N0bHMKPj4+
Pj4+Pj4+Pj4+IHRvIHNldHVwIHRoZSBiYWNrZW5kLgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IFRpd2VpIEJpZSA8dGl3ZWkuYmllQGludGVsLmNvbT4KPj4+Pj4+Pj4+
Pj4+IC0tLQo+Pj4+Pj4+Pj4+Pj4gVGhpcyBwYXRjaCBkZXBlbmRzIG9uIGJlbG93IHNlcmllczoK
Pj4+Pj4+Pj4+Pj4+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzEwLzE3LzI4Ngo+Pj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IHYxIC0+IHYyOgo+Pj4+Pj4+Pj4+Pj4gLSBSZXBsYWNlIF9TRVRf
U1RBVEUgd2l0aCBfU0VUX1NUQVRVUyAoTVNUKTsKPj4+Pj4+Pj4+Pj4+IC0gQ2hlY2sgc3RhdHVz
IGJpdHMgYXQgZWFjaCBzdGVwIChNU1QpOwo+Pj4+Pj4+Pj4+Pj4gLSBSZXBvcnQgdGhlIG1heCBy
aW5nIHNpemUgYW5kIG1heCBudW1iZXIgb2YgcXVldWVzIChNU1QpOwo+Pj4+Pj4+Pj4+Pj4gLSBB
ZGQgbWlzc2luZyBNT0RVTEVfREVWSUNFX1RBQkxFIChKYXNvbik7Cj4+Pj4+Pj4+Pj4+PiAtIE9u
bHkgc3VwcG9ydCB0aGUgbmV0d29yayBiYWNrZW5kIHcvbyBtdWx0aXF1ZXVlIGZvciBub3c7Cj4+
Pj4+Pj4+Pj4+IEFueSBpZGVhIG9uIGhvdyB0byBleHRlbmQgaXQgdG8gc3VwcG9ydAo+Pj4+Pj4+
Pj4+PiBkZXZpY2VzIG90aGVyIHRoYW4gbmV0PyBJIHRoaW5rIHdlCj4+Pj4+Pj4+Pj4+IHdhbnQg
YSBnZW5lcmljIEFQSSBvciBhbiBBUEkgdGhhdCBjb3VsZAo+Pj4+Pj4+Pj4+PiBiZSBtYWRlIGdl
bmVyaWMgaW4gdGhlIGZ1dHVyZS4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gRG8gd2Ugd2FudCB0
byBlLmcgaGF2aW5nIGEgZ2VuZXJpYyB2aG9zdAo+Pj4+Pj4+Pj4+PiBtZGV2IGZvciBhbGwga2lu
ZHMgb2YgZGV2aWNlcyBvcgo+Pj4+Pj4+Pj4+PiBpbnRyb2R1Y2luZyBlLmcgdmhvc3QtbmV0LW1k
ZXYgYW5kIHZob3N0LXNjc2ktbWRldj8KPj4+Pj4+Pj4+PiBPbmUgcG9zc2libGUgd2F5IGlzIHRv
IGRvIHdoYXQgdmhvc3QtdXNlciBkb2VzLiBJLmUuIEFwYXJ0IGZyb20KPj4+Pj4+Pj4+PiB0aGUg
Z2VuZXJpYyByaW5nLCBmZWF0dXJlcywgLi4uIHJlbGF0ZWQgaW9jdGxzLCB3ZSBhbHNvIGludHJv
ZHVjZQo+Pj4+Pj4+Pj4+IGRldmljZSBzcGVjaWZpYyBpb2N0bHMgd2hlbiB3ZSBuZWVkIHRoZW0u
IEFzIHZob3N0LW1kZXYganVzdCBuZWVkcwo+Pj4+Pj4+Pj4+IHRvIGZvcndhcmQgY29uZmlncyBi
ZXR3ZWVuIHBhcmVudCBhbmQgdXNlcnNwYWNlIGFuZCBldmVuIHdvbid0Cj4+Pj4+Pj4+Pj4gY2Fj
aGUgYW55IGluZm8gd2hlbiBwb3NzaWJsZSwKPj4+Pj4+Pj4+IFNvIGl0IGxvb2tzIHRvIG1lIHRo
aXMgaXMgb25seSBwb3NzaWJsZSBpZiB3ZQo+Pj4+Pj4+Pj4gZXhwb3NlIGUuZyBzZXRfY29uZmln
IGFuZAo+Pj4+Pj4+Pj4gZ2V0X2NvbmZpZyB0byB1c2Vyc3BhY2UuCj4+Pj4+Pj4+IFRoZSBzZXRf
Y29uZmlnIGFuZCBnZXRfY29uZmlnIGludGVyZmFjZSBpc24ndCByZWFsbHkgZXZlcnl0aGluZwo+
Pj4+Pj4+PiBvZiBkZXZpY2Ugc3BlY2lmaWMgc2V0dGluZ3MuIFdlIGFsc28gaGF2ZSBjdHJscSBp
biB2aXJ0aW8tbmV0Lgo+Pj4+Pj4+IFllcywgYnV0IGl0IGNvdWxkIGJlIHByb2Nlc3NlZCBieSB0
aGUgZXhpc3QgQVBJLiBJc24ndAo+Pj4+Pj4+IGl0PyBKdXN0IHNldCBjdHJsIHZxCj4+Pj4+Pj4g
YWRkcmVzcyBhbmQgbGV0IHBhcmVudCB0byBkZWFsIHdpdGggdGhhdC4KPj4+Pj4+IEkgbWVhbiBo
b3cgdG8gZXhwb3NlIGN0cmxxIHJlbGF0ZWQgc2V0dGluZ3MgdG8gdXNlcnNwYWNlPwo+Pj4+PiBJ
IHRoaW5rIGl0IHdvcmtzIGxpa2U6Cj4+Pj4+Cj4+Pj4+IDEpIHVzZXJzcGFjZSBmaW5kIGN0cmxf
dnEgaXMgc3VwcG9ydGVkCj4+Pj4+Cj4+Pj4+IDIpIHRoZW4gaXQgY2FuIGFsbG9jYXRlIG1lbW9y
eSBmb3IgY3RybCB2cSBhbmQgc2V0IGl0cyBhZGRyZXNzIHRocm91Z2gKPj4+Pj4gdmhvc3QtbWRl
dgo+Pj4+Pgo+Pj4+PiAzKSB1c2Vyc3BhY2UgY2FuIHBvcHVsYXRlIGN0cmwgdnEgaXRzZWxmCj4+
Pj4gSSBzZWUuIFRoYXQgaXMgdG8gc2F5LCB1c2Vyc3BhY2UgZS5nLiBRRU1VIHdpbGwgcHJvZ3Jh
bSB0aGUKPj4+PiBjdHJsIHZxIHdpdGggdGhlIGV4aXN0aW5nIFZIT1NUXypfVlJJTkdfKiBpb2N0
bHMsIGFuZCBwYXJlbnQKPj4+PiBkcml2ZXJzIHNob3VsZCBrbm93IHRoYXQgdGhlIGFkZHJlc3Nl
cyB1c2VkIGluIGN0cmwgdnEgYXJlCj4+Pj4gaG9zdCB2aXJ0dWFsIGFkZHJlc3NlcyBpbiB2aG9z
dC1tZGV2J3MgY2FzZS4KPj4+Cj4+PiBUaGF0J3MgcmVhbGx5IGdvb2QgcG9pbnQuIEFuZCB0aGF0
IG1lYW5zIHBhcmVudCBuZWVkcyB0byBkaWZmZXIgdmhvc3QKPj4+IGZyb20gdmlydGlvLiBJdCBz
aG91bGQgd29yay4KPj4KPj4gSFZBIG1heSBvbmx5IHdvcmsgd2hlbiB3ZSBoYXZlIHNvbWV0aGlu
ZyBzaW1pbGFyIHRvIFZIT1NUX1NFVF9PV05FUiB3aGljaAo+PiBjYW4gcmV1c2UgTU0gb2YgaXRz
IG93bmVyLgo+IFdlIGFscmVhZHkgaGF2ZSBWSE9TVF9TRVRfT1dORVIgaW4gdmhvc3Qgbm93LCBw
YXJlbnQgY2FuIGhhbmRsZQo+IHRoZSBjb21tYW5kcyBpbiBpdHMgLmtpY2tfdnEoKSB3aGljaCBp
cyBjYWxsZWQgYnkgdnEncyAuaGFuZGxlX2tpY2sKPiBjYWxsYmFjay4gVmlydGlvLXVzZXIgZGlk
IHNvbWV0aGluZyBzaW1pbGFyOgo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL0RQREsvZHBkay9ibG9i
LzBkYTdmNDQ1ZGY0NDU2MzBjNzk0ODk3MzQ3ZWUzNjBkNmZlNjM0OGIvZHJpdmVycy9uZXQvdmly
dGlvL3ZpcnRpb191c2VyX2V0aGRldi5jI0wzMTMtTDMyMgoKClRoaXMgcHJvYmFibHkgbWVhbnMg
YSBwcm9jZXNzIGNvbnRleHQgaXMgcmVxdWlyZWQsIHNvbWV0aGluZyBsaWtlIAprdGhyZWFkIHRo
YXQgaXMgdXNlZCBieSB2aG9zdCB3aGljaCBzZWVtcyBhIGJ1cmRlbiBmb3IgcGFyZW50LiBPciB3
ZSBjYW4gCmV4dGVuZCBpb2N0bCB0byBwcm9jZXNzaW5nIGtpY2sgaW4gdGhlIHN5c3RlbSBjYWxs
IGNvbnRleHQuCgoKPgo+Pgo+Pj4gQnV0IGlzIHRoZXJlIGFueSBjaGFuY2UgdG8gdXNlIERNQSBh
ZGRyZXNzPyBJJ20gYXNraW5nIHNpbmNlIHRoZSBBUEkKPj4+IHRoZW4gdGVuZHMgdG8gYmUgZGV2
aWNlIHNwZWNpZmljLgo+Pgo+PiBJIHdvbmRlciB3aGV0aGVyIHdlIGNhbiBpbnRyb2R1Y2UgTUFQ
IElPTU1VIG5vdGlmaWVyIGFuZCBnZXQgRE1BIG1hcHBpbmdzCj4+IGZyb20gdGhhdC4KPiBJIHRo
aW5rIHRoaXMgd2lsbCBjb21wbGljYXRlIHRoaW5ncyB1bm5lY2Vzc2FyaWx5IGFuZCBtYXkKPiBi
cmluZyBwYWlucy4gQmVjYXVzZSwgaW4gdmhvc3QtbWRldiwgbWRldidzIGN0cmwgdnEgaXMKPiBz
dXBwb3NlZCB0byBiZSBtYW5hZ2VkIGJ5IGhvc3QuCgoKWWVzLgoKCj4gICBBbmQgd2Ugc2hvdWxk
IHRyeSB0byBhdm9pZAo+IHB1dHRpbmcgY3RybCB2cSBhbmQgUngvVHggdnFzIGluIHRoZSBzYW1l
IERNQSBzcGFjZSB0byBwcmV2ZW50Cj4gZ3Vlc3RzIGhhdmluZyB0aGUgY2hhbmNlIHRvIGJ5cGFz
cyB0aGUgaG9zdCAoZS5nLiBRRU1VKSB0bwo+IHNldHVwIHRoZSBiYWNrZW5kIGFjY2VsZXJhdG9y
IGRpcmVjdGx5LgoKClRoYXQncyByZWFsbHkgZ29vZCBwb2ludC7CoCBTbyB3aGVuICJ2aG9zdCIg
dHlwZSBpcyBjcmVhdGVkLCBwYXJlbnQgCnNob3VsZCBhc3N1bWUgYWRkciBvZiBjdHJsX3ZxIGlz
IGh2YS4KClRoYW5rcwoKCj4KPj4gVGhhbmtzCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
