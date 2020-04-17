Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC001ADA03
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 11:33:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8C9F87658;
	Fri, 17 Apr 2020 09:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZnTJ5I6JVrO; Fri, 17 Apr 2020 09:33:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EA2687669;
	Fri, 17 Apr 2020 09:33:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07866C0172;
	Fri, 17 Apr 2020 09:33:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DF6BC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0D4D786302
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U50m3MZq7R2q
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:33:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 31DDF862BE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 09:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587115992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhGeUvxGcTXLdmHA9NT0UPQF+FHUIR0Zeja74ZUVplA=;
 b=TEDWZSBS/UxK9PJgwSRIxgwJ4LqRjOtYQaz9knlty0tRviOy74zJH/qBM2Ar37nJSfJ8Xa
 rxJ2vBqU0PDmNSTQn28wZsCQNUjjgH+6XI0ziwMhANOdB/skySQemJOhR77eGcA85OqxTy
 1rLiCvqHJ6imUnMmKU74FRfE0plg62Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-OVKHQIXwNXKHVGLh1l_TJQ-1; Fri, 17 Apr 2020 05:33:08 -0400
X-MC-Unique: OVKHQIXwNXKHVGLh1l_TJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3C53107ACCA;
 Fri, 17 Apr 2020 09:33:06 +0000 (UTC)
Received: from [10.72.13.157] (ovpn-13-157.pek2.redhat.com [10.72.13.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86A0A5C1D6;
 Fri, 17 Apr 2020 09:32:58 +0000 (UTC)
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
 <73843240-3040-655d-baa9-683341ed4786@redhat.com>
 <20200417045454-mutt-send-email-mst@kernel.org>
 <CAMuHMdXbzd9puG6gGri4jUtUT8rFrqnWwZ1NwP=47WQJ_eBC5g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2f5681bb-a8e6-fe73-57f5-24de7a5a72e8@redhat.com>
Date: Fri, 17 Apr 2020 17:32:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXbzd9puG6gGri4jUtUT8rFrqnWwZ1NwP=47WQJ_eBC5g@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vasily Gorbik <gor@linux.ibm.com>, KVM list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 netdev <netdev@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

Ck9uIDIwMjAvNC8xNyDkuIvljYg1OjI1LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkg
TWljaGFlbCwKPgo+IE9uIEZyaSwgQXByIDE3LCAyMDIwIGF0IDEwOjU3IEFNIE1pY2hhZWwgUy4g
VHNpcmtpbjxtc3RAcmVkaGF0LmNvbT4gIHdyb3RlOgo+PiBPbiBGcmksIEFwciAxNywgMjAyMCBh
dCAwNDo1MToxOVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4gT24gMjAyMC80LzE3IOS4
i+WNiDQ6NDYsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+PiBPbiBGcmksIEFwciAxNywg
MjAyMCBhdCAwNDozOTo0OVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+PiBPbiAyMDIw
LzQvMTcg5LiL5Y2INDoyOSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4+Pj4gT24gRnJp
LCBBcHIgMTcsIDIwMjAgYXQgMDM6MzY6NTJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4+
Pj4+PiBPbiAyMDIwLzQvMTcg5LiL5Y2IMjozMywgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+
Pj4+Pj4+PiBPbiBGcmksIEFwciAxNywgMjAyMCBhdCAxMToxMjoxNEFNICswODAwLCBKYXNvbiBX
YW5nIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMjAyMC80LzE3IOS4iuWNiDY6NTUsIE1pY2hhZWwgUy4g
VHNpcmtpbiB3cm90ZToKPj4+Pj4+Pj4+PiBPbiBXZWQsIEFwciAxNSwgMjAyMCBhdCAxMDo0Mzo1
NkFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBXZSB0cnkgdG8ga2VlcCB0
aGUgZGVmY29uZmlnIHVudG91Y2hlZCBhZnRlciBkZWNvdXBsaW5nIENPTkZJR19WSE9TVAo+Pj4+
Pj4+Pj4+PiBvdXQgb2YgQ09ORklHX1ZJUlRVQUxJWkFUSU9OIGluIGNvbW1pdCAyMGMzODRmMWVh
MWEKPj4+Pj4+Pj4+Pj4gKCJ2aG9zdDogcmVmaW5lIHZob3N0IGFuZCB2cmluZ2gga2NvbmZpZyIp
IGJ5IGVuYWJsaW5nIFZIT1NUX01FTlUgYnkKPj4+Pj4+Pj4+Pj4gZGVmYXVsdC4gVGhlbiB0aGUg
ZGVmY29uZmlncyBjYW4ga2VlcCBlbmFibGluZyBDT05GSUdfVkhPU1RfTkVUCj4+Pj4+Pj4+Pj4+
IHdpdGhvdXQgdGhlIGNhcmluZyBvZiBDT05GSUdfVkhPU1QuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+IEJ1dCB0aGlzIHdpbGwgbGVhdmUgYSAiQ09ORklHX1ZIT1NUX01FTlU9eSIgaW4gYWxsIGRl
ZmNvbmZpZ3MgYW5kIGV2ZW4KPj4+Pj4+Pj4+Pj4gZm9yIHRoZSBvbmVzIHRoYXQgZG9lc24ndCB3
YW50IHZob3N0LiBTbyBpdCBhY3R1YWxseSBzaGlmdHMgdGhlCj4+Pj4+Pj4+Pj4+IGJ1cmRlbnMg
dG8gdGhlIG1haW50YWluZXJzIG9mIGFsbCBvdGhlciB0byBhZGQgIkNPTkZJR19WSE9TVF9NRU5V
IGlzCj4+Pj4+Pj4+Pj4+IG5vdCBzZXQiLiBTbyB0aGlzIHBhdGNoIHRyaWVzIHRvIGVuYWJsZSBD
T05GSUdfVkhPU1QgZXhwbGljaXRseSBpbgo+Pj4+Pj4+Pj4+PiBkZWZjb25maWdzIHRoYXQgZW5h
YmxlcyBDT05GSUdfVkhPU1RfTkVUIGFuZCBDT05GSUdfVkhPU1RfVlNPQ0suCj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+IEFja2VkLWJ5OiBDaHJpc3RpYW4gQm9ybnRyYWVnZXI8Ym9ybnRyYWVnZXJA
ZGUuaWJtLmNvbT4gICAgKHMzOTApCj4+Pj4+Pj4+Pj4+IEFja2VkLWJ5OiBNaWNoYWVsIEVsbGVy
bWFuPG1wZUBlbGxlcm1hbi5pZC5hdT4gICAgKHBvd2VycGMpCj4+Pj4+Pj4+Pj4+IENjOiBUaG9t
YXMgQm9nZW5kb2VyZmVyPHRzYm9nZW5kQGFscGhhLmZyYW5rZW4uZGU+Cj4+Pj4+Pj4+Pj4+IENj
OiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0PGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPj4+Pj4+
Pj4+Pj4gQ2M6IFBhdWwgTWFja2VycmFzPHBhdWx1c0BzYW1iYS5vcmc+Cj4+Pj4+Pj4+Pj4+IENj
OiBNaWNoYWVsIEVsbGVybWFuPG1wZUBlbGxlcm1hbi5pZC5hdT4KPj4+Pj4+Pj4+Pj4gQ2M6IEhl
aWtvIENhcnN0ZW5zPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+Cj4+Pj4+Pj4+Pj4+IENjOiBW
YXNpbHkgR29yYmlrPGdvckBsaW51eC5pYm0uY29tPgo+Pj4+Pj4+Pj4+PiBDYzogQ2hyaXN0aWFu
IEJvcm50cmFlZ2VyPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+Cj4+Pj4+Pj4+Pj4+IFJlcG9ydGVk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW48Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4+Pj4+Pj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmc8amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4+Pj4+Pj4+
PiBJIHJlYmFzZWQgdGhpcyBvbiB0b3Agb2YgT0FCSSBmaXggc2luY2UgdGhhdAo+Pj4+Pj4+Pj4+
IHNlZW1zIG1vcmUgb3JnZW50IHRvIGZpeC4KPj4+Pj4+Pj4+PiBQdXNoZWQgdG8gbXkgdmhvc3Qg
YnJhbmNoIHBscyB0YWtlIGEgbG9vayBhbmQKPj4+Pj4+Pj4+PiBpZiBwb3NzaWJsZSB0ZXN0Lgo+
Pj4+Pj4+Pj4+IFRoYW5rcyEKPj4+Pj4+Pj4+IEkgdGVzdCB0aGlzIHBhdGNoIGJ5IGdlbmVyYXRp
bmcgdGhlIGRlZmNvbmZpZ3MgdGhhdCB3YW50cyB2aG9zdF9uZXQgb3IKPj4+Pj4+Pj4+IHZob3N0
X3Zzb2NrLiBBbGwgbG9va3MgZmluZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBCdXQgaGF2aW5nIENP
TkZJR19WSE9TVF9EUE49eSBtYXkgZW5kIHVwIHdpdGggdGhlIHNpbWlsYXIgc2l0dWF0aW9uIHRo
YXQKPj4+Pj4+Pj4+IHRoaXMgcGF0Y2ggd2FudCB0byBhZGRyZXNzLgo+Pj4+Pj4+Pj4gTWF5YmUg
d2UgY2FuIGxldCBDT05GSUdfVkhPU1QgZGVwZW5kcyBvbiAhQVJNIHx8IEFFQUJJIHRoZW4gYWRk
IGFub3RoZXIKPj4+Pj4+Pj4+IG1lbnVjb25maWcgZm9yIFZIT1NUX1JJTkcgYW5kIGRvIHNvbWV0
aGluZyBzaW1pbGFyPwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoYW5rcwo+Pj4+Pj4+PiBTb3JyeSBJ
IGRvbid0IHVuZGVyc3RhbmQuIEFmdGVyIHRoaXMgcGF0Y2ggQ09ORklHX1ZIT1NUX0RQTiBpcyBq
dXN0Cj4+Pj4+Pj4+IGFuIGludGVybmFsIHZhcmlhYmxlIGZvciB0aGUgT0FCSSBmaXguIEkga2Vw
dCBpdCBzZXBhcmF0ZQo+Pj4+Pj4+PiBzbyBpdCdzIGVhc3kgdG8gcmV2ZXJ0IGZvciA1LjguIFll
cyB3ZSBjb3VsZCBzcXVhc2ggaXQgaW50bwo+Pj4+Pj4+PiBWSE9TVCBkaXJlY3RseSBidXQgSSBk
b24ndCBzZWUgaG93IHRoYXQgY2hhbmdlcyBsb2dpYyBhdCBhbGwuCj4+Pj4+Pj4gU29ycnkgZm9y
IGJlaW5nIHVuY2xlYXIuCj4+Pj4+Pj4KPj4+Pj4+PiBJIG1lYW50IHNpbmNlIGl0IHdhcyBlbmFi
bGVkIGJ5IGRlZmF1bHQsICJDT05GSUdfVkhPU1RfRFBOPXkiIHdpbGwgYmUgbGVmdAo+Pj4+Pj4+
IGluIHRoZSBkZWZjb25maWdzLgo+Pj4+Pj4gQnV0IHdobyBjYXJlcz8KPj4+Pj4gRllJLCBwbGVh
c2Ugc2VlaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMva3ZtL21zZzIxMjY4NS5odG1sCj4+
Pj4gVGhlIGNvbXBsYWludCB3YXMgbm90IGFib3V0IHRoZSBzeW1ib2wgSUlVQy4gIEl0IHdhcyB0
aGF0IHdlIGNhdXNlZAo+Pj4+IGV2ZXJ5b25lIHRvIGJ1aWxkIHZob3N0IHVubGVzcyB0aGV5IG1h
bnVhbGx5IGRpc2FibGVkIGl0Lgo+Pj4gVGhlcmUgY291bGQgYmUgc29tZSBtaXN1bmRlcnN0YW5k
aW5nIGhlcmUuIEkgdGhvdWdodCBpdCdzIHNvbWVob3cgc2ltaWxhcjogYQo+Pj4gQ09ORklHX1ZI
T1NUX01FTlU9eSB3aWxsIGJlIGxlZnQgaW4gdGhlIGRlZmNvbmZpZ3MgZXZlbiBpZiBDT05GSUdf
VkhPU1QgaXMKPj4+IG5vdCBzZXQuCj4+Pgo+Pj4gVGhhbmtzCj4+IEhtbS4gU28gbG9va2luZyBh
dCBEb2N1bWVudGF0aW9uL2tidWlsZC9rY29uZmlnLWxhbmd1YWdlLnJzdCA6Cj4+Cj4+ICAgICAg
ICAgIFRoaW5ncyB0aGF0IG1lcml0ICJkZWZhdWx0IHkvbSIgaW5jbHVkZToKPj4KPj4gICAgICAg
ICAgYSkgQSBuZXcgS2NvbmZpZyBvcHRpb24gZm9yIHNvbWV0aGluZyB0aGF0IHVzZWQgdG8gYWx3
YXlzIGJlIGJ1aWx0Cj4+ICAgICAgICAgICAgIHNob3VsZCBiZSAiZGVmYXVsdCB5Ii4KPj4KPj4g
ICAgICAgICAgYikgQSBuZXcgZ2F0ZWtlZXBpbmcgS2NvbmZpZyBvcHRpb24gdGhhdCBoaWRlcy9z
aG93cyBvdGhlciBLY29uZmlnCj4+ICAgICAgICAgICAgIG9wdGlvbnMgKGJ1dCBkb2VzIG5vdCBn
ZW5lcmF0ZSBhbnkgY29kZSBvZiBpdHMgb3duKSwgc2hvdWxkIGJlCj4+ICAgICAgICAgICAgICJk
ZWZhdWx0IHkiIHNvIHBlb3BsZSB3aWxsIHNlZSB0aG9zZSBvdGhlciBvcHRpb25zLgo+Pgo+PiAg
ICAgICAgICBjKSBTdWItZHJpdmVyIGJlaGF2aW9yIG9yIHNpbWlsYXIgb3B0aW9ucyBmb3IgYSBk
cml2ZXIgdGhhdCBpcwo+PiAgICAgICAgICAgICAiZGVmYXVsdCBuIi4gVGhpcyBhbGxvd3MgeW91
IHRvIHByb3ZpZGUgc2FuZSBkZWZhdWx0cy4KPj4KPj4KPj4gU28gaXQgbG9va3MgbGlrZSBWSE9T
VF9NRU5VIGlzIGFjdHVhbGx5IG1hdGNoaW5nIHJ1bGUgYikuCj4+IFNvIHdoYXQncyB0aGUgcHJv
YmxlbSB3ZSBhcmUgdHJ5aW5nIHRvIHNvbHZlIHdpdGggdGhpcyBwYXRjaCwgZXhhY3RseT8KPj4K
Pj4gR2VlcnQgY291bGQgeW91IGNsYXJpZnkgcGxzPwo+IEkgY2FuIGNvbmZpcm0gVkhPU1RfTUVO
VSBpcyBtYXRjaGluZyBydWxlIGIpLCBzbyBpdCBpcyBzYWZlIHRvIGFsd2F5cwo+IGVuYWJsZSBp
dC4KPgo+IEdye29ldGplLGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0CgoKUmlnaHQsIHNvIEkgdGhpbmsgd2UgY2FuIGRyb3AgdGhpcyBwYXRjaC4KClRoYW5rcwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
