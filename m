Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 344807D4C1
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 07:14:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B5FC3438D;
	Thu,  1 Aug 2019 05:13:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F2A8438E
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 05:02:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E9111821
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 05:02:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 218028A004;
	Thu,  1 Aug 2019 05:02:25 +0000 (UTC)
Received: from [10.72.12.66] (ovpn-12-66.pek2.redhat.com [10.72.12.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC4F4600C4;
	Thu,  1 Aug 2019 05:02:19 +0000 (UTC)
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
Date: Thu, 1 Aug 2019 13:02:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731193057.GG3946@ziepe.ca>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 01 Aug 2019 05:02:25 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

Ck9uIDIwMTkvOC8xIOS4iuWNiDM6MzAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBXZWQs
IEp1bCAzMSwgMjAxOSBhdCAwOToyODoyMFBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+PiBP
biAyMDE5LzcvMzEg5LiL5Y2IODozOSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gT24gV2Vk
LCBKdWwgMzEsIDIwMTkgYXQgMDQ6NDY6NTNBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+
PiBXZSB1c2VkIHRvIHVzZSBSQ1UgdG8gc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdpdGggd29y
a2VyLiBUaGlzIGxlYWRzCj4+Pj4gY2FsbGluZyBzeW5jaHJvbml6ZV9yY3UoKSBpbiBpbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0KCkuIEJ1dCBvbiBhIGJ1c3kKPj4+PiBzeXN0ZW0sIHRoZXJlIHdvdWxk
IGJlIG1hbnkgZmFjdG9ycyB0aGF0IG1heSBzbG93IGRvd24gdGhlCj4+Pj4gc3luY2hyb25pemVf
cmN1KCkgd2hpY2ggbWFrZXMgaXQgdW5zdWl0YWJsZSB0byBiZSBjYWxsZWQgaW4gTU1VCj4+Pj4g
bm90aWZpZXIuCj4+Pj4KPj4+PiBBIHNvbHV0aW9uIGlzIFNSQ1UgYnV0IGl0cyBvdmVyaGVhZCBp
cyBvYnZpb3VzIHdpdGggdGhlIGV4cGVuc2l2ZSBmdWxsCj4+Pj4gbWVtb3J5IGJhcnJpZXIuIEFu
b3RoZXIgY2hvaWNlIGlzIHRvIHVzZSBzZXFsb2NrLCBidXQgaXQgZG9lc24ndAo+Pj4+IHByb3Zp
ZGUgYSBzeW5jaHJvbml6YXRpb24gbWV0aG9kIGJldHdlZW4gcmVhZGVycyBhbmQgd3JpdGVycy4g
VGhlIGxhc3QKPj4+PiBjaG9pY2UgaXMgdG8gdXNlIHZxIG11dGV4LCBidXQgaXQgbmVlZCB0byBk
ZWFsIHdpdGggdGhlIHdvcnN0IGNhc2UKPj4+PiB0aGF0IE1NVSBub3RpZmllciBtdXN0IGJlIGJs
b2NrZWQgYW5kIHdhaXQgZm9yIHRoZSBmaW5pc2ggb2Ygc3dhcCBpbi4KPj4+Pgo+Pj4+IFNvIHRo
aXMgcGF0Y2ggc3dpdGNoZXMgdXNlIGEgY291bnRlciB0byB0cmFjayB3aGV0aGVyIG9yIG5vdCB0
aGUgbWFwCj4+Pj4gd2FzIHVzZWQuIFRoZSBjb3VudGVyIHdhcyBpbmNyZWFzZWQgd2hlbiB2cSB0
cnkgdG8gc3RhcnQgb3IgZmluaXNoCj4+Pj4gdXNlcyB0aGUgbWFwLiBUaGlzIG1lYW5zLCB3aGVu
IGl0IHdhcyBldmVuLCB3ZSdyZSBzdXJlIHRoZXJlJ3Mgbm8KPj4+PiByZWFkZXJzIGFuZCBNTVUg
bm90aWZpZXIgaXMgc3luY2hyb25pemVkLiBXaGVuIGl0IHdhcyBvZGQsIGl0IG1lYW5zCj4+Pj4g
dGhlcmUncyBhIHJlYWRlciB3ZSBuZWVkIHRvIHdhaXQgaXQgdG8gYmUgZXZlbiBhZ2FpbiB0aGVu
IHdlIGFyZQo+Pj4+IHN5bmNocm9uaXplZC4KPj4+IFlvdSBqdXN0IGRlc2NyaWJlZCBhIHNlcWxv
Y2suCj4+Cj4+IEtpbmQgb2YsIHNlZSBteSBleHBsYW5hdGlvbiBiZWxvdy4KPj4KPj4KPj4+IFdl
J3ZlIGJlZW4gdGFsa2luZyBhYm91dCBwcm92aWRpbmcgdGhpcyBhcyBzb21lIGNvcmUgc2Vydmlj
ZSBmcm9tIG1tdQo+Pj4gbm90aWZpZXJzIGJlY2F1c2UgbmVhcmx5IGV2ZXJ5IHVzZSBvZiB0aGlz
IEFQSSBuZWVkcyBpdC4KPj4KPj4gVGhhdCB3b3VsZCBiZSB2ZXJ5IGhlbHBmdWwuCj4+Cj4+Cj4+
PiBJTUhPIHRoaXMgZ2V0cyB0aGUgd2hvbGUgdGhpbmcgYmFja3dhcmRzLCB0aGUgY29tbW9uIHBh
dHRlcm4gaXMgdG8KPj4+IHByb3RlY3QgdGhlICdzaGFkb3cgcHRlJyBkYXRhIHdpdGggYSBzZXFs
b2NrICh1c3VhbGx5IG9wZW4gY29kZWQpLAo+Pj4gc3VjaCB0aGF0IHRoZSBtbXUgbm90aWZpZmVy
IHNpZGUgaGFzIHRoZSB3cml0ZSBzaWRlIG9mIHRoYXQgbG9jayBhbmQKPj4+IHRoZSByZWFkIHNp
ZGUgaXMgY29uc3VtZWQgYnkgdGhlIHRocmVhZCBhY2Nlc3Npbmcgb3IgdXBkYXRpbmcgdGhlIFNQ
VEUuCj4+Cj4+IFllcywgSSd2ZSBjb25zaWRlcmVkIHNvbWV0aGluZyBsaWtlIHRoYXQuIEJ1dCB0
aGUgcHJvYmxlbSBpcywgbW11IG5vdGlmaWVyCj4+ICh3cml0ZXIpIG5lZWQgdG8gd2FpdCBmb3Ig
dGhlIHZob3N0IHdvcmtlciB0byBmaW5pc2ggdGhlIHJlYWQgYmVmb3JlIGl0IGNhbgo+PiBkbyB0
aGluZ3MgbGlrZSBzZXR0aW5nIGRpcnR5IHBhZ2VzIGFuZCB1bm1hcHBpbmcgcGFnZS7CoCBJdCBs
b29rcyB0byBtZQo+PiBzZXFsb2NrIGRvZXNuJ3QgcHJvdmlkZSB0aGluZ3MgbGlrZSB0aGlzLgo+
IFRoZSBzZXFsb2NrIGlzIHVzdWFsbHkgdXNlZCB0byBwcmV2ZW50IGEgMm5kIHRocmVhZCBmcm9t
IGFjY2Vzc2luZyB0aGUKPiBWQSB3aGlsZSBpdCBpcyBiZWluZyBjaGFuZ2VkIGJ5IHRoZSBtbS4g
aWUgeW91IHVzZSBzb21ldGhpbmcgc2VxbG9ja3kKPiBpbnN0ZWFkIG9mIHRoZSB1Z2x5IG1tdV9u
b3RpZmllcl91bnJlZ2lzdGVyL3JlZ2lzdGVyIGN5Y2xlLgoKClllcywgc28gd2UgaGF2ZSB0d28g
bWFwcGluZ3M6CgpbMV0gdnJpbmcgYWRkcmVzcyB0byBWQQpbMl0gVkEgdG8gUEEKCkFuZCBoYXZl
IHNldmVyYWwgcmVhZGVycyBhbmQgd3JpdGVycwoKMSkgc2V0X3ZyaW5nX251bV9hZGRyKCk6IHdy
aXRlciBvZiBib3RoIFsxXSBhbmQgWzJdCjIpIE1NVSBub3RpZmllcjogcmVhZGVyIG9mIFsxXSB3
cml0ZXIgb2YgWzJdCjMpIEdVUDogcmVhZGVyIG9mIFsxXSB3cml0ZXIgb2YgWzJdCjQpIG1lbW9y
eSBhY2Nlc3NvcnM6IHJlYWRlciBvZiBbMV0gYW5kIFsyXQoKRm9ydHVuYXRlbHksIDEpIDMpIGFu
ZCA0KSBoYXZlIGFscmVhZHkgc3luY2hyb25pemVkIHRocm91Z2ggdnEtPm11dGV4LiAKV2Ugb25s
eSBuZWVkIHRvIGRlYWwgd2l0aCBzeW5jaHJvbml6YXRpb24gYmV0d2VlbiAyKSBhbmQgZWFjaCBv
ZiB0aGUgcmVzZXQ6ClN5bmMgYmV0d2VlbiAxKSBhbmQgMik6IEZvciBtYXBwaW5nIFsxXSwgSSBk
byAKbW11X25vdGlmaWVyX3VucmVnaXN0ZXIvcmVnaXN0ZXIuIFRoaXMgaGVscCB0byBhdm9pZCBo
b2xkaW5nIGFueSBsb2NrIHRvIApkbyBvdmVybGFwIGNoZWNrLiBBbnl3YXkgd2Ugb25seSBjYXJl
IGFib3V0IG9uZSBvciB0aHJlZSBwYWdlcyAsIGJ1dCB0aGUgCndob2xlIGd1ZXN0IG1lbW9yeSBj
b3VsZCBiZSBzZXZlcmFsIFRCcy4gRm9yIG1hcHBpbmcgWzJdLCBib3RoIDEpIGFuZCAyKSAKYXJl
IHdyaXRlcnMsIHNvIHVzZSBzcGlubG9jayAobW11X2xvY2spIHRvIHN5bmNocm9uaXplLgpTeW5j
IGJldHdlZW4gMikgYW5kIDMpOiBGb3IgbWFwcGluZyBbMV0sIGJvdGggYXJlIHJlYWRlcnMsIG5v
IG5lZWQgYW55IApzeW5jaHJvbml6YXRpb24uIEZvciBtYXBwaW5nIFsyXSwgYm90aCAyKSBhbmQg
MykgYXJlIHdyaXRlcnMsIHNvIApzeW5jaHJvbml6ZSB0aHJvdWdoIHNwaW5sb2NrIChtbXVfbG9j
ayk7ClN5bmMgYmV0d2VlbiAyKSBhbmQgNCk6IEZvciBtYXBwaW5nIFsxXSwgYm90aCBhcmUgcmVh
ZGVycywgbm8gbmVlZCBhbnkgCnN5bmNocm9uaXphdGlvbi4gRm9yIG1hcHBpbmcgWzJdLCBzeW5j
aHJvbml6ZSB0aHJvdWdoIFJDVSAob3Igc29tZXRoaW5nIApzaW1saWFyIHRvIHNlcWxvY2spLgoK
WW91IHN1Z2dlc3Rpb24gaXMgYWJvdXQgdGhlIHN5bmNocm9uaXphdGlvbiBvZiBbMV0gd2hpY2gg
bWF5IG1ha2Ugc2Vuc2UsIApidXQgaXQgY291bGQgYmUgZG9uZSBvbiB0b3AgYXMgYW4gb3B0aW1p
emF0aW9uLiBXaGF0IHRoaXMgcGF0aCB0cmllcyB0byAKZG8gaXMgdG8gbm90IHVzZSBSQ1UgZm9y
IFsyXS4gT2YgY291cnNlLCB0aGUgc2ltcGxlc3Qgd2F5IGlzIHRvIHVzZSB2cSAKbXV0ZXggaW4g
MikgYnV0IGl0IG1lYW5zOgotIHdlIG11c3QgaG9sZCB2cSBsb2NrIHRvIGNoZWNrIHJhbmdlIG92
ZXJsYXAKLSBzaW5jZSB0aGUgY3JpdGljYWwgc2VjdGlvbiB3YXMgaW5jcmVhc2VkLCB0aGUgd29y
c3QgY2FzZSBpcyB0byB3YWl0IApndWVzdCBtZW1vcnkgdG8gYmUgc3dhcHBlZCBpbiwgdGhpcyBj
b3VsZCBiZSBldmVuIHNsb3dlciB0aGFuIApzeW5jaHJvbml6ZV9yY3UoKS4KCgo+Cj4gWW91IGFy
ZSBzdXBwb3NlZCB0byB1c2Ugc29tZXRoaW5nIHNpbXBsZSBsaWtlIGEgc3BpbmxvY2sgb3IgbXV0
ZXgKPiBpbnNpZGUgdGhlIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQgdG8gc2VyaWFsaXplZCB0ZWFy
IGRvd24gb2YgdGhlIFNQVEVzCj4gd2l0aCB0aGVpciBhY2Nlc3NvcnMuCgoKVGVjaG5pY2FsbHkg
eWVzLCBidXQgd2UgcHJvYmFibHkgY2FuJ3QgYWZmb3JkIHRoYXQgZm9yIHZob3N0IGZhc3QgcGF0
aCwgCnRoZSBhdG9taWNzIGVsaW1pbmF0ZSBhbG1vc3QgYWxsIHRoZSBwZXJmb3JtYW5jZSBpbXBy
b3ZlbWVudCBicm91Z2h0IGJ5IAp0aGlzIHBhdGNoIG9uIGEgbWFjaGluZSB3aXRob3V0IFNNQVAu
CgoKPgo+PiB3cml0ZV9zZXFjb3VudF9iZWdpbigpCj4+Cj4+IG1hcCA9IHZxLT5tYXBbWF0KPj4K
Pj4gd3JpdGUgb3IgcmVhZCB0aHJvdWdoIG1hcC0+YWRkciBkaXJlY3RseQo+Pgo+PiB3cml0ZV9z
ZXFjb3VudF9lbmQoKQo+Pgo+Pgo+PiBUaGVyZSdzIG5vIHJtYigpIGluIHdyaXRlX3NlcWNvdW50
X2JlZ2luKCksIHNvIG1hcCBjb3VsZCBiZSByZWFkIGJlZm9yZQo+PiB3cml0ZV9zZXFjb3VudF9i
ZWdpbigpLCBidXQgaXQgbG9va3MgdG8gbWUgbm93IHRoYXQgdGhpcyBkb2Vzbid0IGhhcm0gYXQK
Pj4gYWxsLCBtYXliZSB3ZSBjYW4gdHJ5IHRoaXMgd2F5Lgo+IFRoYXQgaXMgYmVjYXVzZSBpdCBp
cyBhIHdyaXRlIHNpZGUgbG9jaywgbm90IGEgcmVhZCBsb2NrLiBJSVJDCj4gc2VxbG9ja3MgaGF2
ZSB3ZWFrZXIgYmFycmllcnMgYmVjYXVzZSB0aGUgd3JpdGUgc2lkZSBuZWVkcyB0byBiZQo+IHNl
cmlhbGl6ZWQgaW4gc29tZSBvdGhlciB3YXkuCgoKWWVzLiBIYXZpbmcgYSBoYXJkIHRob3VnaHQg
b2YgdGhlIGNvZGUsIGl0IGxvb2tzIHRvIG1lIAp3cml0ZV9zZXFjb3VudF9iZWdpbigpL2VuZCgp
IGlzIHN1ZmZpY2llbnQgaGVyZToKCi0gTm90aWZpZXIgd2lsbCBvbmx5IGFzc2lnbiBOVUxMIHRv
IG1hcCwgc28gaXQgZG9lc24ndCBoYXJtIHRvIHJlYWQgbWFwIApiZWZvcmUgc2VxLCB0aGVuIHdl
IHdpbGwgZmFsbGJhY2sgdG8gbm9ybWFsIGNvcHlfZnJvbS90b191c2VyKCkgc2xvdyAKcGF0aCBl
YXJsaWVyCi0gaWYgd2Ugd3JpdGUgdGhyb3VnaCBtYXAtPmFkZHIsIGl0IHNob3VsZCBiZSBkb25l
IGJlZm9yZSBpbmNyZWFzaW5nIHRoZSAKc2VxY291bnQgYmVjYXVzZSBvZiB0aGUgc21wX3dtYigp
IGluIHdyaXRlX3NlcWNvdW50X2VuZCgpCi0gaWYgd2UgcmVhZCB0aHJvdWdoIG1hcC0+YWRkciB3
aGljaCBhbHNvIGNvbnRhaW4gYSBzdG9yZSB0byBhIHBvaW50ZXIsIAp3ZSBoYXZlIGEgZ29vZCBk
YXRhIGRlcGVuZGVuY3kgc28gc21wX3dtYigpIGFsc28gd29yayBoZXJlLgoKCj4KPiBUaGUgcmVx
dWlyZW1lbnQgSSBzZWUgaXMgeW91IG5lZWQgaW52YWxpZGF0ZV9yYW5nZV9zdGFydCB0byBibG9j
awo+IHVudGlsIGFub3RoZXIgdGhyZWFkIGV4aXRzIGl0cyBjcml0aWNhbCBzZWN0aW9uIChpZSBz
dG9wcyBhY2Nlc3NpbmcKPiB0aGUgU1BURXMpLgoKClllcy4KCgo+Cj4gVGhhdCBpcyBhIHNwaW5s
b2NrL211dGV4LgoKCk9yIGEgc2VtYW50aWNzIHNpbWlsYXIgdG8gUkNVLgoKCj4KPiBZb3UganVz
dCBjYW4ndCBpbnZlbnQgYSBmYXN0ZXIgc3BpbmxvY2sgYnkgb3BlbiBjb2Rpbmcgc29tZXRoaW5n
IHdpdGgKPiBiYXJyaWVycywgaXQgZG9lc24ndCB3b3JrLgo+Cj4gSmFzb24KCgpJZiB3cml0ZV9z
ZXFsb2NrKCkgd29ya3MgaGVyZSwgd2UgY2FuIHNpbXBseSB3YWl0IGZvciBzZXFjb3VudCB0byBt
b3ZlIAphZHZhbmNlIGluIE1NVSBub3RpZmllci4gVGhlIG9yaWdpbmFsIGlkZWEgaXMgdG8gdXNl
IFJDVSB3aGljaCBzb2x2ZXMgCnRoaXMgcGVyZmVjdGx5LiBCdXQgYXMgcG9pbnRlZCBvdXQgaXQg
Y291bGQgYmUgc2xvdy4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
