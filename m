Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BD81A438D
	for <lists.virtualization@lfdr.de>; Fri, 10 Apr 2020 10:33:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA7EC880D2;
	Fri, 10 Apr 2020 08:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UQxGh4j0n3Q; Fri, 10 Apr 2020 08:33:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 72AE4880D0;
	Fri, 10 Apr 2020 08:33:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 674E6C0177;
	Fri, 10 Apr 2020 08:33:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF280C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 94E4E880D0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2Ucu3Lp4ily
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:33:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 607CC87903
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586507595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgngn9BuGL/zJPxWxLHGSpP5ErqyA3e9IEzjGvABwSY=;
 b=AIcj2jLMThFSsQh2QXBgUsmq/ibaGk0KAyJGYdk3tz8Gp0Ps1o2gnt2kaOJ1mNGH1QUxkK
 TCzWrwqIw85eK1QWYAwLRQjYwkYN/OEmMXIhba+4J/AFtEsyyYyEizRJ6aGRjemoh/TDVU
 YHKkoTbhidrn238RquTZlaqrfeH7L9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-mTxGTSp4NpS6RmU_ltFrAg-1; Fri, 10 Apr 2020 04:33:09 -0400
X-MC-Unique: mTxGTSp4NpS6RmU_ltFrAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1CF2107ACC7;
 Fri, 10 Apr 2020 08:33:07 +0000 (UTC)
Received: from [10.72.12.205] (ovpn-12-205.pek2.redhat.com [10.72.12.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B44F5C1BB;
 Fri, 10 Apr 2020 08:33:02 +0000 (UTC)
Subject: Re: vhost: refine vhost and vringh kconfig
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <git-mailbomb-linux-master-20c384f1ea1a0bc7320bc445c72dd02d2970d594@kernel.org>
 <CAMuHMdUkff8XUrbHa90nGxa8Kj3HO9b2CRO57s3YZrSFPM51pg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f7fc96d4-de8e-cdce-bd98-242cdade2843@redhat.com>
Date: Fri, 10 Apr 2020 16:33:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUkff8XUrbHa90nGxa8Kj3HO9b2CRO57s3YZrSFPM51pg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: virtualization@lists.linux-foundation.org, KVM list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Ck9uIDIwMjAvNC8xMCDkuIvljYgzOjUzLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkg
SmFzb24sCj4KPiBPbiBUaHUsIEFwciA5LCAyMDIwIGF0IDY6MDQgQU0gTGludXggS2VybmVsIE1h
aWxpbmcgTGlzdAo+IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiB3cm90ZToKPj4gQ29t
bWl0OiAgICAgMjBjMzg0ZjFlYTFhMGJjNzMyMGJjNDQ1YzcyZGQwMmQyOTcwZDU5NAo+PiBQYXJl
bnQ6ICAgICA1YTZiNGNjNWI3YTE4OTJhOGQ3ZjYzZDZjYmFjNmUwYWUyYTlkMDMxCj4+IFJlZm5h
bWU6ICAgIHJlZnMvaGVhZHMvbWFzdGVyCj4+IFdlYjogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvdG9ydmFsZHMvYy8yMGMzODRmMWVhMWEwYmM3MzIwYmM0NDVjNzJkZDAyZDI5NzBkNTk0
Cj4+IEF1dGhvcjogICAgIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+IEF1dGhv
ckRhdGU6IFRodSBNYXIgMjYgMjI6MDE6MTcgMjAyMCArMDgwMAo+PiBDb21taXR0ZXI6ICBNaWNo
YWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+PiBDb21taXREYXRlOiBXZWQgQXByIDEg
MTI6MDY6MjYgMjAyMCAtMDQwMAo+Pgo+PiAgICAgIHZob3N0OiByZWZpbmUgdmhvc3QgYW5kIHZy
aW5naCBrY29uZmlnCj4+Cj4+ICAgICAgQ3VycmVudGx5LCBDT05GSUdfVkhPU1QgZGVwZW5kcyBv
biBDT05GSUdfVklSVFVBTElaQVRJT04uIEJ1dCB2aG9zdCBpcwo+PiAgICAgIG5vdCBuZWNlc3Nh
cmlseSBmb3IgVk0gc2luY2UgaXQncyBhIGdlbmVyaWMgdXNlcnNwYWNlIGFuZCBrZXJuZWwKPj4g
ICAgICBjb21tdW5pY2F0aW9uIHByb3RvY29sLiBTdWNoIGRlcGVuZGVuY3kgbWF5IHByZXZlbnQg
YXJjaHMgd2l0aG91dAo+PiAgICAgIHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgZnJvbSB1c2luZyB2
aG9zdC4KPj4KPj4gICAgICBUbyBzb2x2ZSB0aGlzLCBhIGRlZGljYXRlZCB2aG9zdCBtZW51IGlz
IGNyZWF0ZWQgdW5kZXIgZHJpdmVycyBzbwo+PiAgICAgIENPTklGR19WSE9TVCBjYW4gYmUgZGVj
b3VwbGVkIG91dCBvZiBDT05GSUdfVklSVFVBTElaQVRJT04uCj4+Cj4+ICAgICAgV2hpbGUgYXQg
aXQsIGFsc28gc3F1YXNoIEtjb25maWcudnJpbmdoIGludG8gdmhvc3QgS2NvbmZpZyBmaWxlLiBU
aGlzCj4+ICAgICAgYXZvaWRzIHRoZSB0cmljayBvZiBjb25kaXRpb25hbCBpbmNsdXNpb24gZnJv
bSBWT1Agb3IgQ0FJRi4gVGhlbiBpdAo+PiAgICAgIHdpbGwgYmUgZWFzaWVyIHRvIGludHJvZHVj
ZSBuZXcgdnJpbmdoIHVzZXJzIGFuZCBjb21tb24gZGVwZW5kZW5jeSBmb3IKPj4gICAgICBib3Ro
IHZyaW5naCBhbmQgdmhvc3QuCj4+Cj4+ICAgICAgU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8
amFzb3dhbmdAcmVkaGF0LmNvbT4KPj4gICAgICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjAwMzI2MTQwMTI1LjE5Nzk0LTItamFzb3dhbmdAcmVkaGF0LmNvbQo+PiAgICAgIFNp
Z25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4+IC0tLQo+
PiAgIGFyY2gvYXJtL2t2bS9LY29uZmlnICAgICAgICAgfCAgMiAtLQo+PiAgIGFyY2gvYXJtNjQv
a3ZtL0tjb25maWcgICAgICAgfCAgMiAtLQo+PiAgIGFyY2gvbWlwcy9rdm0vS2NvbmZpZyAgICAg
ICAgfCAgMiAtLQo+PiAgIGFyY2gvcG93ZXJwYy9rdm0vS2NvbmZpZyAgICAgfCAgMiAtLQo+PiAg
IGFyY2gvczM5MC9rdm0vS2NvbmZpZyAgICAgICAgfCAgNCAtLS0tCj4+ICAgYXJjaC94ODYva3Zt
L0tjb25maWcgICAgICAgICB8ICA0IC0tLS0KPj4gICBkcml2ZXJzL0tjb25maWcgICAgICAgICAg
ICAgIHwgIDIgKysKPj4gICBkcml2ZXJzL21pc2MvbWljL0tjb25maWcgICAgIHwgIDQgLS0tLQo+
PiAgIGRyaXZlcnMvbmV0L2NhaWYvS2NvbmZpZyAgICAgfCAgNCAtLS0tCj4+ICAgZHJpdmVycy92
aG9zdC9LY29uZmlnICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPj4g
ICBkcml2ZXJzL3Zob3N0L0tjb25maWcudnJpbmdoIHwgIDYgLS0tLS0tCj4+ICAgMTEgZmlsZXMg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCj4+IC0tLSBhL2RyaXZl
cnMvdmhvc3QvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3Zob3N0L0tjb25maWcKPj4gQEAgLTEs
NCArMSwyMyBAQAo+PiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+
PiArY29uZmlnIFZIT1NUX1JJTkcKPj4gKyAgICAgICB0cmlzdGF0ZQo+PiArICAgICAgIGhlbHAK
Pj4gKyAgICAgICAgIFRoaXMgb3B0aW9uIGlzIHNlbGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2gg
bmVlZHMgdG8gYWNjZXNzCj4+ICsgICAgICAgICB0aGUgaG9zdCBzaWRlIG9mIGEgdmlydGlvIHJp
bmcuCj4+ICsKPj4gK2NvbmZpZyBWSE9TVAo+PiArICAgICAgIHRyaXN0YXRlCj4+ICsgICAgICAg
c2VsZWN0IFZIT1NUX0lPVExCCj4+ICsgICAgICAgaGVscAo+PiArICAgICAgICAgVGhpcyBvcHRp
b24gaXMgc2VsZWN0ZWQgYnkgYW55IGRyaXZlciB3aGljaCBuZWVkcyB0byBhY2Nlc3MKPj4gKyAg
ICAgICAgIHRoZSBjb3JlIG9mIHZob3N0Lgo+PiArCj4+ICttZW51Y29uZmlnIFZIT1NUX01FTlUK
Pj4gKyAgICAgICBib29sICJWSE9TVCBkcml2ZXJzIgo+PiArICAgICAgIGRlZmF1bHQgeQo+IFBs
ZWFzZSBkbyBub3QgdXNlIGRlZmF1bHQgeS4gWW91ciBzdWJzeXN0ZW0gaXMgbm90IHNwZWNpYWwu
CgoKVGhpcyBpcyBiZWNhdXNlIGJlZm9yZSB0aGlzIHBhdGNoIFZIT1NUIGRlcGVuZHMgb24gVklS
VFVBTElaQVRJT04uIFNvIAp0aGUgYXJjaHMgd2hvc2UgZGVmY29uZmlnIHRoYXQgaGFzIFZJUlRV
QUxJWkFUSU9OIGNhbiBqdXN0IGVuYWJsZSBlLmcgClZIT1NUX05FVCB3aXRob3V0IGNhcmluZyBh
Ym91dCBWSE9TVF9NRU5VLgoKSWYgdGhpcyBpcyBub3QgcHJlZmVyYWJsZSwgd2UgY2FuOgoKMSkg
bW9kaWZ5IHRoZSBkZWZjb25maWcgYW5kIGVuYWJsZSBWSE9TVF9NRU5VIHRoZXJlCjIpIHN3aXRj
aCB0byB1c2UgZGVmYXVsdCB5IGlmICQoYWxsX2FyY2hzX3RoYXRfaGFzX1ZJUlRVQUxJWkFUSU9O
KQoKCj4KPj4gKwo+IEkgdGhpbmsgdGhpcyBkZXNlcnZlcyBhIGhlbHAgdGV4dCwgc28gdXNlcnMg
a25vdyBpZiB0aGV5IHdhbnQgdG8gZW5hYmxlIHRoaXMKPiBvcHRpb24gb3Igbm90LgoKCldpbGwg
YWRkIG9uZS4KClRoYW5rcwoKCj4KPiBUaGFua3MhCj4KPj4gK2lmIFZIT1NUX01FTlUKPj4gKwo+
PiAgIGNvbmZpZyBWSE9TVF9ORVQKPj4gICAgICAgICAgdHJpc3RhdGUgIkhvc3Qga2VybmVsIGFj
Y2VsZXJhdG9yIGZvciB2aXJ0aW8gbmV0Igo+PiAgICAgICAgICBkZXBlbmRzIG9uIE5FVCAmJiBF
VkVOVEZEICYmIChUVU4gfHwgIVRVTikgJiYgKFRBUCB8fCAhVEFQKQo+IEdye29ldGplLGVldGlu
Z31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4KPgo+IC0tCj4gR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwo+Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAo+IHdoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
