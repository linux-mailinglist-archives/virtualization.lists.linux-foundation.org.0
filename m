Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD751BB891
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 10:13:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9281A84AB2;
	Tue, 28 Apr 2020 08:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oC+ya8R850g3; Tue, 28 Apr 2020 08:13:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD0BD84DFD;
	Tue, 28 Apr 2020 08:13:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CE15C0889;
	Tue, 28 Apr 2020 08:13:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3EF7C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 08:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E274D87E5B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 08:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTDDFAYvaBox
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 08:13:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BD80C87E4D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588061624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyRKuzpWR77tocYAqun+YTjfRtHpPA8xvoTqR86LZ0M=;
 b=NTEZFyhlHemPrIR9QkcZhAQkpW+dkONboek+55ynMQ5kmRehZu8CiKIaC/k5TUtCgjezxV
 jGsS4+0IHPLL4aQ6aPvtSpQFcGBKB0g9Ndibpj6Ga0ac1FdkRGmnZ6veC+LfljkGWOfTT0
 0CdnbX2yTB3d+0xLhQ8r3BAq1TAVv4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-zbElCxm3MAqo-lGPyHfa2Q-1; Tue, 28 Apr 2020 04:13:35 -0400
X-MC-Unique: zbElCxm3MAqo-lGPyHfa2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A758A107B7C5;
 Tue, 28 Apr 2020 08:13:33 +0000 (UTC)
Received: from [10.72.13.181] (ovpn-13-181.pek2.redhat.com [10.72.13.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C9F860D53;
 Tue, 28 Apr 2020 08:13:23 +0000 (UTC)
Subject: Re: [PATCH net-next 0/3] vsock: support network namespace
To: Stefano Garzarella <sgarzare@redhat.com>, davem@davemloft.net,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200427142518.uwssa6dtasrp3bfc@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <224cdc10-1532-7ddc-f113-676d43d8f322@redhat.com>
Date: Tue, 28 Apr 2020 16:13:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427142518.uwssa6dtasrp3bfc@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Jorgen Hansen <jhansen@vmware.com>
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

Ck9uIDIwMjAvNC8yNyDkuIvljYgxMDoyNSwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+IEhp
IERhdmlkLCBNaWNoYWVsLCBTdGVmYW4sCj4gSSdtIHJlc3RhcnRpbmcgdG8gd29yayBvbiB0aGlz
IHRvcGljIHNpbmNlIEthdGEgZ3V5cyBhcmUgaW50ZXJlc3RlZCB0bwo+IGhhdmUgdGhhdCwgZXNw
ZWNpYWxseSBvbiB0aGUgZ3Vlc3Qgc2lkZS4KPgo+IFdoaWxlIHdvcmtpbmcgb24gdGhlIHYyIEkg
aGFkIGZldyBkb3VidHMsIGFuZCBJJ2QgbGlrZSB0byBoYXZlIHlvdXIKPiBzdWdnZXN0aW9uczoK
Pgo+ICAgMS4gbmV0bnMgYXNzaWduZWQgdG8gdGhlIGRldmljZSBpbnNpZGUgdGhlIGd1ZXN0Cj4K
PiAgICAgQ3VycmVudGx5IEkgYXNzaWduZWQgdGhpcyBkZXZpY2UgdG8gJ2luaXRfbmV0Jy4gTWF5
YmUgaXQgaXMgYmV0dGVyCj4gICAgIGlmIHdlIGFsbG93IHRoZSB1c2VyIHRvIGRlY2lkZSB3aGlj
aCBuZXRucyBhc3NpZ24gdG8gdGhlIGRldmljZQo+ICAgICBvciB0byBkaXNhYmxlIHRoaXMgbmV3
IGZlYXR1cmUgdG8gaGF2ZSB0aGUgc2FtZSBiZWhhdmlvciBhcyBiZWZvcmUKPiAgICAgKGhvc3Qg
cmVhY2hhYmxlIGZyb20gYW55IG5ldG5zKS4KPiAgICAgSSB0aGluayB3ZSBjYW4gaGFuZGxlIHRo
aXMgaW4gdGhlIHZzb2NrIGNvcmUgYW5kIG5vdCBpbiB0aGUgc2luZ2xlCj4gICAgIHRyYW5zcG9y
dHMuCj4KPiAgICAgVGhlIHNpbXBsZXN0IHdheSB0aGF0IEkgZm91bmQsIGlzIHRvIGFkZCBhIG5l
dwo+ICAgICBJT0NUTF9WTV9TT0NLRVRTX0FTU0lHTl9HMkhfTkVUTlMgdG8gL2Rldi92c29jayB0
byBlbmFibGUgdGhlIGZlYXR1cmUKPiAgICAgYW5kIGFzc2lnbiB0aGUgZGV2aWNlIHRvIHRoZSBz
YW1lIG5ldG5zIG9mIHRoZSBwcm9jZXNzIHRoYXQgZG8gdGhlCj4gICAgIGlvY3RsKCksIGJ1dCBJ
J20gbm90IHN1cmUgaXQgaXMgY2xlYW4gZW5vdWdoLgo+Cj4gICAgIE1heWJlIGl0IGlzIGJldHRl
ciB0byBhZGQgbmV3IHJ0bmV0bGluayBtZXNzYWdlcywgYnV0IEknbSBub3Qgc3VyZSBpZgo+ICAg
ICBpdCBpcyBmZWFzaWJsZSBzaW5jZSB3ZSBkb24ndCBoYXZlIGEgbmV0ZGV2IGRldmljZS4KPgo+
ICAgICBXaGF0IGRvIHlvdSBzdWdnZXN0PwoKCkFzIHdlJ3ZlIGRpc2N1c3NlZCwgaXQgc2hvdWxk
IGJlIGEgbmV0ZGV2IHByb2JhYmx5IGluIGVpdGhlciBndWVzdCBvciAKaG9zdCBzaWRlLiBBbmQg
aXQgd291bGQgYmUgbXVjaCBzaW1wbGVyIGlmIHdlIHdhbnQgZG8gaW1wbGVtZW50IApuYW1lc3Bh
Y2UgdGhlbi4gTm8gbmV3IEFQSSBpcyBuZWVkZWQuCgpUaGFua3MKCgo+Cj4KPiAgIDIuIG5ldG5z
IGFzc2lnbmVkIGluIHRoZSBob3N0Cj4KPiAgICAgIEFzIE1pY2hhZWwgc3VnZ2VzdGVkLCBJIGFk
ZGVkIGEgbmV3IC9kZXYvdmhvc3QtdnNvY2stbmV0bnMgdG8gYWxsb3cKPiAgICAgIHVzZXJzcGFj
ZSBhcHBsaWNhdGlvbiB0byB1c2UgdGhpcyBuZXcgZmVhdHVyZSwgbGVhdmluZyB0bwo+ICAgICAg
L2Rldi92aG9zdC12c29jayB0aGUgcHJldmlvdXMgYmVoYXZpb3IgKGd1ZXN0IHJlYWNoYWJsZSBm
cm9tIGFueQo+ICAgICAgbmV0bnMpLgo+Cj4gICAgICBJIGxpa2UgdGhpcyBhcHByb2FjaCwgYnV0
IEkgaGFkIHRoZXNlIGRvdWJ0czoKPgo+ICAgICAgLSBJIG5lZWQgdG8gYWxsb2NhdGUgYSBuZXcg
bWlub3IgZm9yIHRoYXQgZGV2aWNlIChlLmcuCj4gICAgICAgIFZIT1NUX1ZTT0NLX05FVE5TX01J
Tk9SKSBvciBpcyB0aGVyZSBhbiBhbHRlcm5hdGl2ZSB3YXkgdGhhdCBJIGNhbgo+ICAgICAgICB1
c2U/Cj4KPiAgICAgIC0gSXQgaXMgdmhvc3QtdnNvY2sgc3BlY2lmaWMsIHNob3VsZCB3ZSBwcm92
aWRlIHNvbWV0aGluZyBoYW5kbGVkIGluCj4gICAgICAgIHRoZSB2c29jayBjb3JlLCBtYXliZSBj
ZW50cmFsaXppbmcgdGhlIENJRCBhbGxvY2F0aW9uIGFuZCBhZGRpbmcgYQo+ICAgICAgICBuZXcg
SU9DVEwgb3IgcnRuZXRsaW5rIG1lc3NhZ2UgbGlrZSBmb3IgdGhlIGd1ZXN0IHNpZGU/Cj4gICAg
ICAgIChtYXliZSBpdCBjb3VsZCBiZSBhIHNlY29uZCBzdGVwLCBhbmQgZm9yIG5vdyB3ZSBjYW4g
Y29udGludWUgd2l0aAo+ICAgICAgICB0aGUgbmV3IGRldmljZSkKPgo+Cj4gVGhhbmtzIGZvciB0
aGUgaGVscCwKPiBTdGVmYW5vCj4KPgo+IE9uIFRodSwgSmFuIDE2LCAyMDIwIGF0IDA2OjI0OjI1
UE0gKzAxMDAsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPj4gUkZDIC0+IHYxOgo+PiAgICog
YWRkZWQgJ25ldG5zJyBtb2R1bGUgcGFyYW0gdG8gdnNvY2sua28gdG8gZW5hYmxlIHRoZQo+PiAg
ICAgbmV0d29yayBuYW1lc3BhY2Ugc3VwcG9ydCAoZGlzYWJsZWQgYnkgZGVmYXVsdCkKPj4gICAq
IGFkZGVkICd2c29ja19uZXRfZXEoKScgdG8gY2hlY2sgdGhlICJuZXQiIGFzc2lnbmVkIHRvIGEg
c29ja2V0Cj4+ICAgICBvbmx5IHdoZW4gJ25ldG5zJyBzdXBwb3J0IGlzIGVuYWJsZWQKPj4KPj4g
UkZDOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL2NvdmVyLzEyMDIyMzUvCj4+Cj4+IE5v
dyB0aGF0IHdlIGhhdmUgbXVsdGktdHJhbnNwb3J0IHVwc3RyZWFtLCBJIHN0YXJ0ZWQgdG8gdGFr
ZSBhIGxvb2sgdG8KPj4gc3VwcG9ydCBuZXR3b3JrIG5hbWVzcGFjZSBpbiB2c29jay4KPj4KPj4g
QXMgd2UgcGFydGlhbGx5IGRpc2N1c3NlZCBpbiB0aGUgbXVsdGktdHJhbnNwb3J0IHByb3Bvc2Fs
IFsxXSwgaXQgY291bGQKPj4gYmUgbmljZSB0byBzdXBwb3J0IG5ldHdvcmsgbmFtZXNwYWNlIGlu
IHZzb2NrIHRvIHJlYWNoIHRoZSBmb2xsb3dpbmcKPj4gZ29hbHM6Cj4+IC0gaXNvbGF0ZSBob3N0
IGFwcGxpY2F0aW9ucyBmcm9tIGd1ZXN0IGFwcGxpY2F0aW9ucyB1c2luZyB0aGUgc2FtZSBwb3J0
cwo+PiAgICB3aXRoIENJRF9BTlkKPj4gLSBhc3NpZ24gdGhlIHNhbWUgQ0lEIG9mIFZNcyBydW5u
aW5nIGluIGRpZmZlcmVudCBuZXR3b3JrIG5hbWVzcGFjZXMKPj4gLSBwYXJ0aXRpb24gVk1zIGJl
dHdlZW4gVk1NcyBvciBhdCBmaW5lciBncmFudWxhcml0eQo+Pgo+PiBUaGlzIG5ldyBmZWF0dXJl
IGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQsIGJlY2F1c2UgaXQgY2hhbmdlcyB2c29jaydzCj4+IGJl
aGF2aW9yIHdpdGggbmV0d29yayBuYW1lc3BhY2VzIGFuZCBjb3VsZCBicmVhayBleGlzdGluZyBh
cHBsaWNhdGlvbnMuCj4+IEl0IGNhbiBiZSBlbmFibGVkIHdpdGggdGhlIG5ldyAnbmV0bnMnIG1v
ZHVsZSBwYXJhbWV0ZXIgb2YgdnNvY2sua28uCj4+Cj4+IFRoaXMgaW1wbGVtZW50YXRpb24gcHJv
dmlkZXMgdGhlIGZvbGxvd2luZyBiZWhhdmlvcjoKPj4gLSBwYWNrZXRzIHJlY2VpdmVkIGZyb20g
dGhlIGhvc3QgKHJlY2VpdmVkIGJ5IEcySCB0cmFuc3BvcnRzKSBhcmUKPj4gICAgYXNzaWduZWQg
dG8gdGhlIGRlZmF1bHQgbmV0bnMgKGluaXRfbmV0KQo+PiAtIHBhY2tldHMgcmVjZWl2ZWQgZnJv
bSB0aGUgZ3Vlc3QgKHJlY2VpdmVkIGJ5IEgyRyAtIHZob3N0LXZzb2NrKSBhcmUKPj4gICAgYXNz
aWduZWQgdG8gdGhlIG5ldG5zIG9mIHRoZSBwcm9jZXNzIHRoYXQgb3BlbnMgL2Rldi92aG9zdC12
c29jawo+PiAgICAodXN1YWxseSB0aGUgVk1NLCBxZW11IGluIG15IHRlc3RzLCBvcGVucyB0aGUg
L2Rldi92aG9zdC12c29jaykKPj4gICAgICAtIGZvciB2bWNpIEkgbmVlZCBzb21lIHN1Z2dlc3Rp
b25zLCBiZWNhdXNlIEkgZG9uJ3Qga25vdyBob3cgdG8gZG8KPj4gICAgICAgIGFuZCB0ZXN0IHRo
ZSBzYW1lIGluIHRoZSB2bWNpIGRyaXZlciwgZm9yIG5vdyB2bWNpIHVzZXMgdGhlCj4+ICAgICAg
ICBpbml0X25ldAo+PiAtIGxvb3BiYWNrIHBhY2tldHMgYXJlIGV4Y2hhbmdlZCBvbmx5IGluIHRo
ZSBzYW1lIG5ldG5zCj4+Cj4+IEkgdGVzdGVkIHRoZSBzZXJpZXMgaW4gdGhpcyB3YXk6Cj4+IGww
X2hvc3QkIHFlbXUtc3lzdGVtLXg4Nl82NCAtbSA0RyAtTSBhY2NlbD1rdm0gLXNtcCA0IFwKPj4g
ICAgICAgICAgICAgIC1kcml2ZSBmaWxlPS90bXAvdnNvY2t2bTAuaW1nLGlmPXZpcnRpbyAtLW5v
Z3JhcGhpYyBcCj4+ICAgICAgICAgICAgICAtZGV2aWNlIHZob3N0LXZzb2NrLXBjaSxndWVzdC1j
aWQ9Mwo+Pgo+PiBsMV92bSQgZWNobyAxID4gL3N5cy9tb2R1bGUvdnNvY2svcGFyYW1ldGVycy9u
ZXRucwo+Pgo+PiBsMV92bSQgaXAgbmV0bnMgYWRkIG5zMQo+PiBsMV92bSQgaXAgbmV0bnMgYWRk
IG5zMgo+PiAgICMgc2FtZSBDSUQgb24gZGlmZmVyZW50IG5ldG5zCj4+IGwxX3ZtJCBpcCBuZXRu
cyBleGVjIG5zMSBxZW11LXN5c3RlbS14ODZfNjQgLW0gMUcgLU0gYWNjZWw9a3ZtIC1zbXAgMiBc
Cj4+ICAgICAgICAgICAgICAtZHJpdmUgZmlsZT0vdG1wL3Zzb2Nrdm0xLmltZyxpZj12aXJ0aW8g
LS1ub2dyYXBoaWMgXAo+PiAgICAgICAgICAgICAgLWRldmljZSB2aG9zdC12c29jay1wY2ksZ3Vl
c3QtY2lkPTQKPj4gbDFfdm0kIGlwIG5ldG5zIGV4ZWMgbnMyIHFlbXUtc3lzdGVtLXg4Nl82NCAt
bSAxRyAtTSBhY2NlbD1rdm0gLXNtcCAyIFwKPj4gICAgICAgICAgICAgIC1kcml2ZSBmaWxlPS90
bXAvdnNvY2t2bTIuaW1nLGlmPXZpcnRpbyAtLW5vZ3JhcGhpYyBcCj4+ICAgICAgICAgICAgICAt
ZGV2aWNlIHZob3N0LXZzb2NrLXBjaSxndWVzdC1jaWQ9NAo+Pgo+PiAgICMgYWxsIGlwZXJmMyBs
aXN0ZW4gb24gQ0lEX0FOWSBhbmQgcG9ydCA1MjAxLCBidXQgaW4gZGlmZmVyZW50IG5ldG5zCj4+
IGwxX3ZtJCAuL2lwZXJmMyAtLXZzb2NrIC1zICMgY29ubmVjdGlvbiBmcm9tIGwwIG9yIGd1ZXN0
cyBzdGFydGVkCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIG9uIGRlZmF1bHQgbmV0
bnMgKGluaXRfbmV0KQo+PiBsMV92bSQgaXAgbmV0bnMgZXhlYyBuczEgLi9pcGVyZjMgLS12c29j
ayAtcwo+PiBsMV92bSQgaXAgbmV0bnMgZXhlYyBuczEgLi9pcGVyZjMgLS12c29jayAtcwo+Pgo+
PiBsMF9ob3N0JCAuL2lwZXJmMyAtLXZzb2NrIC1jIDMKPj4gbDJfdm0xJCAuL2lwZXJmMyAtLXZz
b2NrIC1jIDIKPj4gbDJfdm0yJCAuL2lwZXJmMyAtLXZzb2NrIC1jIDIKPj4KPj4gWzFdIGh0dHBz
Oi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL25ldGRldi9tc2c1NzU3OTIuaHRtbAo+Pgo+PiBTdGVm
YW5vIEdhcnphcmVsbGEgKDMpOgo+PiAgICB2c29jazogYWRkIG5ldHdvcmsgbmFtZXNwYWNlIHN1
cHBvcnQKPj4gICAgdnNvY2svdmlydGlvX3RyYW5zcG9ydF9jb21tb246IGhhbmRsZSBuZXRucyBv
ZiByZWNlaXZlZCBwYWNrZXRzCj4+ICAgIHZob3N0L3Zzb2NrOiB1c2UgbmV0bnMgb2YgcHJvY2Vz
cyB0aGF0IG9wZW5zIHRoZSB2aG9zdC12c29jayBkZXZpY2UKPj4KPj4gICBkcml2ZXJzL3Zob3N0
L3Zzb2NrLmMgICAgICAgICAgICAgICAgICAgfCAyOSArKysrKysrKysrKystLS0tLQo+PiAgIGlu
Y2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmggICAgICAgICAgICB8ICAyICsrCj4+ICAgaW5jbHVk
ZS9uZXQvYWZfdnNvY2suaCAgICAgICAgICAgICAgICAgIHwgIDcgKysrLS0KPj4gICBuZXQvdm13
X3Zzb2NrL2FmX3Zzb2NrLmMgICAgICAgICAgICAgICAgfCA0MSArKysrKysrKysrKysrKysrKysr
LS0tLS0tCj4+ICAgbmV0L3Ztd192c29jay9oeXBlcnZfdHJhbnNwb3J0LmMgICAgICAgIHwgIDUg
Ky0tCj4+ICAgbmV0L3Ztd192c29jay92aXJ0aW9fdHJhbnNwb3J0LmMgICAgICAgIHwgIDIgKysK
Pj4gICBuZXQvdm13X3Zzb2NrL3ZpcnRpb190cmFuc3BvcnRfY29tbW9uLmMgfCAxMiArKysrKyst
LQo+PiAgIG5ldC92bXdfdnNvY2svdm1jaV90cmFuc3BvcnQuYyAgICAgICAgICB8ICA1ICstLQo+
PiAgIDggZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4+
Cj4+IC0tIAo+PiAyLjI0LjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
