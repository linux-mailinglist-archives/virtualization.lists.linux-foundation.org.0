Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF82396B
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 16:09:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9008AE9C;
	Mon, 20 May 2019 14:09:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 78BEAA7A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 14:09:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4E5BB87D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 14:09:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 7so13222098wmo.2
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 07:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=lPfvXgySRybnahLKkw4smuzyEidEfCcqkiUhMgN/vwA=;
	b=G4CnpGjOllF897Ejzy1JtKL51jufOdHJir7SxEEruO8E2cfFGpfFgFEEc/OQqQ+L3d
	URa+ROv00Zia3pg0LaVcLBK86HD39LjJJRp6tmmaSi/UDtebmih9OjSnFnlA0SRzI1xA
	PQvOd7grta099HxpS59GUxkG56IG+BJxUAYhwFyOnzdD2dekNP6W4avpLIqhBZp1Ky81
	ECO5J+Bjarh466KURBJd+8Vun18ntE1yfblg3bpJkS8xcc/0Nef9TprIZ8PgAr9l8SUq
	FqFeku3sodX9bUOclE9Ffns571gThDxl72493EeRF3UgLRM367Y23qGFYSuwHDLLvx20
	Y4Jw==
X-Gm-Message-State: APjAAAWR+ottGc2e86LhkL7FRC4V0LsD4jyfrPvvNjIWqNbduXmvvGi8
	sV9RenZbts41vkvlCqOfOl2ypQ==
X-Google-Smtp-Source: APXvYqz5GtHhBy4enUvwmz8hwk6SwMqQAZEOLjJc2ksdwfdlVMTlaXmqw84HWQ8a69KXG5cbK4bQ/w==
X-Received: by 2002:a1c:9904:: with SMTP id b4mr31424112wme.1.1558361381659;
	Mon, 20 May 2019 07:09:41 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151]) by smtp.gmail.com with ESMTPSA id
	i18sm9268216wml.33.2019.05.20.07.09.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 07:09:40 -0700 (PDT)
Date: Mon, 20 May 2019 16:09:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 0/8] vsock/virtio: optimizations to increase the
	throughput
Message-ID: <20190520140938.f26g6jsepfpwspsy@steredhat>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<08c7e0aa-d90d-e0ff-a68c-0e182d077ab2@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08c7e0aa-d90d-e0ff-a68c-0e182d077ab2@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDU6MzM6NDBQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzUvMTAg5LiL5Y2IODo1OCwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3Rl
Ogo+ID4gV2hpbGUgSSB3YXMgdGVzdGluZyB0aGlzIG5ldyBzZXJpZXMgKHYyKSBJIGRpc2NvdmVy
ZWQgYW4gaHVnZSB1c2Ugb2YgbWVtb3J5Cj4gPiBhbmQgYSBtZW1vcnkgbGVhayBpbiB0aGUgdmly
dGlvLXZzb2NrIGRyaXZlciBpbiB0aGUgZ3Vlc3Qgd2hlbiBJIHNlbnQKPiA+IDEtYnl0ZSBwYWNr
ZXRzIHRvIHRoZSBndWVzdC4KPiA+IAo+ID4gVGhlc2UgaXNzdWVzIGFyZSBwcmVzZW50IHNpbmNl
IHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIHZpcnRpby12c29jawo+ID4gZHJpdmVyLiBJIGFkZGVk
IHRoZSBwYXRjaGVzIDEgYW5kIDIgdG8gZml4IHRoZW0gaW4gdGhpcyBzZXJpZXMgaW4gb3JkZXIK
PiA+IHRvIGJldHRlciB0cmFjayB0aGUgcGVyZm9ybWFuY2UgdHJlbmRzLgo+ID4gCj4gPiB2MTog
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDg4NTQzMS8KPiA+IAo+ID4gdjI6
Cj4gPiAtIEFkZCBwYXRjaCAxIHRvIGxpbWl0IHRoZSBtZW1vcnkgdXNhZ2UKPiA+IC0gQWRkIHBh
dGNoIDIgdG8gYXZvaWQgbWVtb3J5IGxlYWsgZHVyaW5nIHRoZSBzb2NrZXQgcmVsZWFzZQo+ID4g
LSBBZGQgcGF0Y2ggMyB0byBmaXggbG9ja2luZyBvZiBmd2RfY250IGFuZCBidWZfYWxsb2MKPiA+
IC0gUGF0Y2ggNDogZml4ICdmcmVlX3NwYWNlJyB0eXBlICh1MzIgaW5zdGVhZCBvZiBzNjQpIFtT
dGVmYW5dCj4gPiAtIFBhdGNoIDU6IEF2b2lkIGludGVnZXIgdW5kZXJmbG93IG9mIGlvdl9sZW4g
W1N0ZWZhbl0KPiA+IC0gUGF0Y2ggNTogRml4IHBhY2tldCBjYXB0dXJlIGluIG9yZGVyIHRvIHNl
ZSB0aGUgZXhhY3QgcGFja2V0cyB0aGF0IGFyZQo+ID4gICAgICAgICAgICAgZGVsaXZlcmVkLiBb
U3RlZmFuXQo+ID4gLSBBZGQgcGF0Y2ggOCB0byBtYWtlIHRoZSBSWCBidWZmZXIgc2l6ZSB0dW5h
YmxlIFtTdGVmYW5dCj4gPiAKPiA+IEJlbG93IGFyZSB0aGUgYmVuY2htYXJrcyBzdGVwIGJ5IHN0
ZXAuIEkgdXNlZCBpcGVyZjMgWzFdIG1vZGlmaWVkIHdpdGggVlNPQ0sKPiA+IHN1cHBvcnQuCj4g
PiBBcyBNaWNoZWFsIHN1Z2dlc3RlZCBpbiB0aGUgdjEsIEkgYm9vdGVkIGhvc3QgYW5kIGd1ZXN0
IHdpdGggJ25vc21hcCcsIGFuZCBJCj4gPiBhZGRlZCBhIGNvbHVtbiB3aXRoIHZpcnRpby1uZXQr
dmhvc3QtbmV0IHBlcmZvcm1hbmNlLgo+ID4gCj4gPiBBIGJyaWVmIGRlc2NyaXB0aW9uIG9mIHBh
dGNoZXM6Cj4gPiAtIFBhdGNoZXMgMSsyOiBsaW1pdCB0aGUgbWVtb3J5IHVzYWdlIHdpdGggYW4g
ZXh0cmEgY29weSBhbmQgYXZvaWQgbWVtb3J5IGxlYWsKPiA+IC0gUGF0Y2hlcyAzKzQ6IGZpeCBs
b2NraW5nIGFuZCByZWR1Y2UgdGhlIG51bWJlciBvZiBjcmVkaXQgdXBkYXRlIG1lc3NhZ2VzIHNl
bnQKPiA+ICAgICAgICAgICAgICAgICB0byB0aGUgdHJhbnNtaXR0ZXIKPiA+IC0gUGF0Y2hlcyA1
KzY6IGFsbG93IHRoZSBob3N0IHRvIHNwbGl0IHBhY2tldHMgb24gbXVsdGlwbGUgYnVmZmVycyBh
bmQgdXNlCj4gPiAgICAgICAgICAgICAgICAgVklSVElPX1ZTT0NLX01BWF9QS1RfQlVGX1NJWkUg
YXMgdGhlIG1heCBwYWNrZXQgc2l6ZSBhbGxvd2VkCj4gPiAtIFBhdGNoZXMgNys4OiBpbmNyZWFz
ZSBSWCBidWZmZXIgc2l6ZSB0byA2NCBLaUIKPiA+IAo+ID4gICAgICAgICAgICAgICAgICAgICAg
aG9zdCAtPiBndWVzdCBbR2Jwc10KPiA+IHBrdF9zaXplIGJlZm9yZSBvcHQgIHAgMSsyICAgIHAg
Mys0ICAgIHAgNSs2ICAgIHAgNys4ICAgICAgIHZpcnRpby1uZXQgKyB2aG9zdAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFRDUF9OT0RFTEFZCj4gPiA2NCAgICAgICAgIDAuMDY4ICAgICAwLjA2MyAgICAwLjEz
MCAgICAwLjEzMSAgICAwLjEyOCAgICAgICAgIDAuMTg4ICAgICAwLjE4Nwo+ID4gMjU2ICAgICAg
ICAwLjI3NCAgICAgMC4yMzYgICAgMC4zOTIgICAgMC4zMzggICAgMC4yODIgICAgICAgICAwLjc0
OSAgICAgMC42NTQKPiA+IDUxMiAgICAgICAgMC41MzEgICAgIDAuNDU3ICAgIDAuODYyICAgIDAu
NzI1ICAgIDAuNjAyICAgICAgICAgMS40MTkgICAgIDEuNDE0Cj4gPiAxSyAgICAgICAgIDAuOTU0
ICAgICAwLjgyNyAgICAxLjU5MSAgICAxLjU5OCAgICAxLjU0OCAgICAgICAgIDIuNTk5ICAgICAy
LjY0MAo+ID4gMksgICAgICAgICAxLjc4MyAgICAgMS41NDMgICAgMy43MzEgICAgMy42MzcgICAg
My40NjkgICAgICAgICA0LjUzMCAgICAgNC43NTQKPiA+IDRLICAgICAgICAgMy4zMzIgICAgIDMu
NDM2ICAgIDcuMTY0ICAgIDcuMTI0ICAgIDYuNDk0ICAgICAgICAgNy43MzggICAgIDcuNjk2Cj4g
PiA4SyAgICAgICAgIDUuNzkyICAgICA1LjUzMCAgIDExLjY1MyAgIDExLjc4NyAgIDExLjQ0NCAg
ICAgICAgMTIuMzA3ICAgIDExLjg1MAo+ID4gMTZLICAgICAgICA4LjQwNSAgICAgOC40NjIgICAx
Ni4zNzIgICAxNi44NTUgICAxNy41NjIgICAgICAgIDE2LjkzNiAgICAxNi45NTQKPiA+IDMySyAg
ICAgICAxNC4yMDggICAgMTMuNjY5ICAgMTguOTQ1ICAgMjAuMDA5ICAgMjMuMTI4ICAgICAgICAy
MS45ODAgICAgMjMuMDE1Cj4gPiA2NEsgICAgICAgMjEuMDgyICAgIDE4Ljg5MyAgIDIwLjI2NiAg
IDIwLjkwMyAgIDMwLjYyMiAgICAgICAgMjcuMjkwICAgIDI3LjM4Mwo+ID4gMTI4SyAgICAgIDIw
LjY5NiAgICAyMC4xNDggICAyMC4xMTIgICAyMS43NDYgICAzMi4xNTIgICAgICAgIDMwLjQ0NiAg
ICAzMC45OTAKPiA+IDI1NksgICAgICAyMC44MDEgICAgMjAuNTg5ICAgMjAuNzI1ICAgMjIuNjg1
ICAgMzQuNzIxICAgICAgICAzMy4xNTEgICAgMzIuNzQ1Cj4gPiA1MTJLICAgICAgMjEuMjIwICAg
IDIwLjQ2NSAgIDIwLjQzMiAgIDIyLjEwNiAgIDM0LjQ5NiAgICAgICAgMzYuODQ3ICAgIDMxLjA5
Ngo+ID4gCj4gPiAgICAgICAgICAgICAgICAgICAgICBndWVzdCAtPiBob3N0IFtHYnBzXQo+ID4g
cGt0X3NpemUgYmVmb3JlIG9wdCAgcCAxKzIgICAgcCAzKzQgICAgcCA1KzYgICAgcCA3KzggICAg
ICAgdmlydGlvLW5ldCArIHZob3N0Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVENQX05PREVMQVkKPiA+IDY0
ICAgICAgICAgMC4wODkgICAgIDAuMDkxICAgIDAuMTIwICAgIDAuMTE1ICAgIDAuMTE3ICAgICAg
ICAgMC4yNzQgICAgIDAuMjcyCj4gPiAyNTYgICAgICAgIDAuMzUyICAgICAwLjM1NCAgICAwLjQ1
MiAgICAwLjQ0NSAgICAwLjQ1MSAgICAgICAgIDEuMDg1ICAgICAxLjEzNgo+ID4gNTEyICAgICAg
ICAwLjcwNSAgICAgMC43MDQgICAgMC44OTMgICAgMC44NTggICAgMC44OTggICAgICAgICAyLjEz
MSAgICAgMS44ODIKPiA+IDFLICAgICAgICAgMS4zOTQgICAgIDEuNDMzICAgIDEuNzIxICAgIDEu
NjY5ICAgIDEuNjkxICAgICAgICAgMy45ODQgICAgIDMuNTc2Cj4gPiAySyAgICAgICAgIDIuODE4
ICAgICAyLjg3NCAgICAzLjMxNiAgICAzLjI0OSAgICAzLjMwMyAgICAgICAgIDYuNzE5ICAgICA2
LjM1OQo+ID4gNEsgICAgICAgICA1LjI5MyAgICAgNS4zOTcgICAgNi4xMjkgICAgNS45MzMgICAg
Ni4wODIgICAgICAgIDEwLjEwNSAgICAgOS44NjAKPiA+IDhLICAgICAgICAgOC44OTAgICAgIDku
MTUxICAgMTAuOTkwICAgMTAuNTQ1ICAgMTAuNTE5ICAgICAgICAxNS4yMzkgICAgMTQuODY4Cj4g
PiAxNksgICAgICAgMTEuNDQ0ICAgIDExLjAxOCAgIDEyLjA3NCAgIDE1LjI1NSAgIDE1LjU3NyAg
ICAgICAgMjAuNTUxICAgIDIwLjg0OAo+ID4gMzJLICAgICAgIDExLjIyOSAgICAxMC44NzUgICAx
MC44NTcgICAyNC40MDEgICAyNS4yMjcgICAgICAgIDI2LjI5NCAgICAyNi4zODAKPiA+IDY0SyAg
ICAgICAxMC44MzIgICAgMTAuNTQ1ICAgMTAuODE2ICAgMzkuNDg3ICAgMzkuNjE2ICAgICAgICAz
NC45OTYgICAgMzIuMDQxCj4gPiAxMjhLICAgICAgMTAuNDM1ICAgIDEwLjI0MSAgIDEwLjUwMCAg
IDM5LjgxMyAgIDQwLjAxMiAgICAgICAgMzguMzc5ICAgIDM1LjA1NQo+ID4gMjU2SyAgICAgIDEw
LjI2MyAgICAgOS44NjYgICAgOS44NDUgICAzNC45NzEgICAzNS4xNDMgICAgICAgIDM2LjU1OSAg
ICAzNy4yMzIKPiA+IDUxMksgICAgICAxMC4yMjQgICAgMTAuMDYwICAgMTAuMDkyICAgMzUuNDY5
ICAgMzQuNjI3ICAgICAgICAzNC45NjMgICAgMzMuNDAxCj4gPiAKPiA+IEFzIFN0ZWZhbiBzdWdn
ZXN0ZWQgaW4gdGhlIHYxLCB0aGlzIHRpbWUgSSBtZWFzdXJlZCBhbHNvIHRoZSBlZmZpY2llbmN5
IGluIHRoaXMKPiA+IHdheToKPiA+ICAgICAgZWZmaWNpZW5jeSA9IE1icHMgLyAoJUNQVV9Ib3N0
ICsgJUNQVV9HdWVzdCkKPiA+IAo+ID4gVGhlICclQ1BVX0d1ZXN0JyBpcyB0YWtlbiBpbnNpZGUg
dGhlIFZNLiBJIGtub3cgdGhhdCBpdCBpcyBub3QgdGhlIGJlc3Qgd2F5LAo+ID4gYnV0IGl0J3Mg
cHJvdmlkZWQgZm9yIGZyZWUgZnJvbSBpcGVyZjMgYW5kIGNvdWxkIGJlIGFuIGluZGljYXRpb24u
Cj4gPiAKPiA+ICAgICAgICAgIGhvc3QgLT4gZ3Vlc3QgZWZmaWNpZW5jeSBbTWJwcyAvICglQ1BV
X0hvc3QgKyAlQ1BVX0d1ZXN0KV0KPiA+IHBrdF9zaXplIGJlZm9yZSBvcHQgIHAgMSsyICAgIHAg
Mys0ICAgIHAgNSs2ICAgIHAgNys4ICAgICAgIHZpcnRpby1uZXQgKyB2aG9zdAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFRDUF9OT0RFTEFZCj4gPiA2NCAgICAgICAgICAwLjk0ICAgICAgMC41OSAgICAgMy45
NiAgICAgNC4wNiAgICAgNC4wOSAgICAgICAgICAyLjgyICAgICAgMi4xMQo+ID4gMjU2ICAgICAg
ICAgMi42MiAgICAgIDIuNTAgICAgIDYuNDUgICAgIDYuMDkgICAgIDUuODEgICAgICAgICAgOS42
NCAgICAgIDguNzMKPiA+IDUxMiAgICAgICAgIDUuMTYgICAgICA0Ljg3ICAgIDEzLjE2ICAgIDEy
LjM5ICAgIDExLjY3ICAgICAgICAgMTcuODMgICAgIDE3Ljc2Cj4gPiAxSyAgICAgICAgICA5LjE2
ICAgICAgOC44NSAgICAyNC45OCAgICAyNC45NyAgICAyNS4wMSAgICAgICAgIDMyLjU3ICAgICAz
Mi4wNAo+ID4gMksgICAgICAgICAxNy40MSAgICAgMTcuMDMgICAgNDkuMDkgICAgNDguNTkgICAg
NDkuMjIgICAgICAgICA1NS4zMSAgICAgNTcuMTQKPiA+IDRLICAgICAgICAgMzIuOTkgICAgIDMz
LjYyICAgIDkwLjgwICAgIDkwLjk4ICAgIDkxLjcyICAgICAgICAgOTEuNzkgICAgIDkxLjQwCj4g
PiA4SyAgICAgICAgIDU4LjUxICAgICA1OS45OCAgIDE1My41MyAgIDE3MC44MyAgIDE2Ny4zMSAg
ICAgICAgMTM3LjUxICAgIDEzMi44NQo+ID4gMTZLICAgICAgICA4OS4zMiAgICAgOTUuMjkgICAy
MTYuOTggICAyNjQuMTggICAyNjAuOTUgICAgICAgIDE3Ni4wNSAgICAxNzYuMDUKPiA+IDMySyAg
ICAgICAxNTIuOTQgICAgMTY3LjEwICAgMjg1Ljc1ICAgMzg3LjAyICAgMzYwLjgxICAgICAgICAy
MTUuNDkgICAgMjI2LjMwCj4gPiA2NEsgICAgICAgMjUwLjM4ICAgIDMwNy4yMCAgIDMxNy42NSAg
IDQ4OS41MyAgIDQ3Mi43MCAgICAgICAgMjM4Ljk3ICAgIDI0NC4yNwo+ID4gMTI4SyAgICAgIDMy
Ny45OSAgICAzMzUuMjQgICAzMzUuNzYgICA1MjMuNzEgICA0ODYuNDEgICAgICAgIDI1My4yOSAg
ICAyNjAuODYKPiA+IDI1NksgICAgICAzMjcuMDYgICAgMzM0LjI0ICAgMzM4LjY0ICAgNTMzLjc2
ICAgNTA5Ljg1ICAgICAgICAyNjcuNzggICAgMjY2LjIyCj4gPiA1MTJLICAgICAgMzM3LjM2ICAg
IDMzMC42MSAgIDMzNC45NSAgIDUxMi45MCAgIDQ5Ni4zNSAgICAgICAgMjgwLjQyICAgIDI0MS40
Mwo+ID4gCj4gPiAgICAgICAgICBndWVzdCAtPiBob3N0IGVmZmljaWVuY3kgW01icHMgLyAoJUNQ
VV9Ib3N0ICsgJUNQVV9HdWVzdCldCj4gPiBwa3Rfc2l6ZSBiZWZvcmUgb3B0ICBwIDErMiAgICBw
IDMrNCAgICBwIDUrNiAgICBwIDcrOCAgICAgICB2aXJ0aW8tbmV0ICsgdmhvc3QKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBUQ1BfTk9ERUxBWQo+ID4gNjQgICAgICAgICAgMC45MCAgICAgIDAuOTEgICAgIDEu
MzcgICAgIDEuMzIgICAgIDEuMzUgICAgICAgICAgMi4xNSAgICAgIDIuMTMKPiA+IDI1NiAgICAg
ICAgIDMuNTkgICAgICAzLjU1ICAgICA1LjIzICAgICA1LjE5ICAgICA1LjI5ICAgICAgICAgIDgu
NTAgICAgICA4Ljg5Cj4gPiA1MTIgICAgICAgICA3LjE5ICAgICAgNy4wOCAgICAxMC4yMSAgICAg
OS45NSAgICAxMC4zOCAgICAgICAgIDE2Ljc0ICAgICAxNC43MQo+ID4gMUsgICAgICAgICAxNC4x
NSAgICAgMTQuMzQgICAgMTkuODUgICAgMTkuMDYgICAgMTkuMzMgICAgICAgICAzMS40NCAgICAg
MjguMTEKPiA+IDJLICAgICAgICAgMjguNDQgICAgIDI5LjA5ICAgIDM3Ljc4ICAgIDM3LjE4ICAg
IDM3LjQ5ICAgICAgICAgNTMuMDcgICAgIDUwLjYzCj4gPiA0SyAgICAgICAgIDU1LjM3ICAgICA1
Ny42MCAgICA3MS4wMiAgICA2OS4yNyAgICA3MC45NyAgICAgICAgIDgxLjU2ICAgICA3OS4zMgo+
ID4gOEsgICAgICAgIDEwNS41OCAgICAxMDAuNDUgICAxMTEuOTUgICAxMjQuNjggICAxMjMuNjEg
ICAgICAgIDEyMC44NSAgICAxMTguNjYKPiA+IDE2SyAgICAgICAxNDEuNjMgICAgMTM4LjI0ICAg
MTM3LjY3ICAgMTg3LjQxICAgMTkwLjIwICAgICAgICAxNjAuNDMgICAgMTYzLjAwCj4gPiAzMksg
ICAgICAgMTQ3LjU2ICAgIDE0My4wOSAgIDEzOC40OCAgIDI5Ni40MSAgIDMwMS4wNCAgICAgICAg
MjE0LjY0ICAgIDIyMy45NAo+ID4gNjRLICAgICAgIDE0NC44MSAgICAxNDMuMjcgICAxMzguNDkg
ICA0MzMuOTggICA0NjIuMjYgICAgICAgIDI5OC44NiAgICAyNjkuNzEKPiA+IDEyOEsgICAgICAx
NTAuMTQgICAgMTQ3Ljk5ICAgMTQ2Ljg1ICAgNTExLjM2ICAgNTE0LjI5ICAgICAgICAzNTAuMTcg
ICAgMjk4LjA5Cj4gPiAyNTZLICAgICAgMTU2LjY5ICAgIDE1Mi4yNSAgIDE0OC42OSAgIDU0Mi4x
OSAgIDU0OS45NyAgICAgICAgMzI2LjQyICAgIDMzMy4zMgo+ID4gNTEySyAgICAgIDE1Ny4yOSAg
ICAxNTMuMzUgICAxNTIuMjIgICA1NDYuNTIgICA1MzMuMjQgICAgICAgIDMxNS41NSAgICAzMDIu
MjcKPiA+IAo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGVmYW5vLWdhcnphcmVsbGEvaXBl
cmYvCj4gCj4gCj4gSGk6Cj4gCj4gRG8geW91IGhhdmUgYW55IGV4cGxhbmF0aW9uIHRoYXQgdnNv
Y2sgaXMgYmV0dGVyIGhlcmU/IElzIHRoaXMgYmVjYXVzZSBvZgo+IHRoZSBtZXJnZWFibGUgYnVm
ZmVyPyBJZiB5b3UsIHdlIG5lZWQgdGVzdCB3aXRoIG1yZ19yeGJ1Zj1vZmYuCj4gCgpIaSBKYXNv
biwKSSB0cmllZCB0byBkaXNhYmxlIHRoZSBtZXJnZWFibGUgYnVmZmVyIGJ1dCBJIGhhZCBldmVu
IHdvcnN0IHBlcmZvcm1hbmNlCndpdGggdmlydGlvLW5ldC4KCkRvIHlvdSB0aGluayB0aGUgZGlm
ZmVyZW5jZXMgY291bGQgYmUgcmVsYXRlZCB0byB0aGUgVENQL0lQIHN0YWNrPwoKVGhhbmtzLApT
dGVmYW5vCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
