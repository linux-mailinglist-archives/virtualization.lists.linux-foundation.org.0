Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A09592B85
	for <lists.virtualization@lfdr.de>; Mon, 15 Aug 2022 12:42:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BD7640A9B;
	Mon, 15 Aug 2022 10:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BD7640A9B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=I9yKjhHs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsr-O8pyRNec; Mon, 15 Aug 2022 10:42:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B779540A96;
	Mon, 15 Aug 2022 10:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B779540A96
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDB39C0078;
	Mon, 15 Aug 2022 10:42:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F91CC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 10:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8F31823A0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 10:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8F31823A0
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I9yKjhHs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2K6coTJS94ZC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 10:42:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C5BF81DCA
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C5BF81DCA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 10:42:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMXMlYTVAf4fMjy60KboL5eYpaz4+JDaiFTNqKwwbFKqezjiqv3WlfcJcTIt62cf304tBm/o40sFq/c7By54p8xgumhiymfZGwP8VdNgdyMztuAxJS4Hp9mzyOUq4KYAtDlrWj8yP1vf4SwZoXo3ut4c/2qSnwWeBs/KAkOBlyUcQ8j7BdAiqAkBFVs46QR8GOVVCTBnugQHZ+5g+X7kZeyqe5VRg2zKd1GWz2X7OX9tlbDOrKJhnzxs4VuznaiHk56Ioq8N4jKmgiAyAhSvEdLsqa37ztVwAS6T2eNrJYvhgEiEw+sW9IL5m/xtfHLjeOFbXUCbfBWuZRyCjNYu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdEM7mASNWY/WlXxM2w5jqRvCc2RGprOJ3UxiIjEE2Y=;
 b=Xr2tuAPUT06EbcVNCGb5/vKmR8fo3Lmxi3m7dCPQ3srRIgOX6K/SujQqNc6PVZuG4up+Dqg34o5h5ubGhzmHOUW9mjWCfxixwI5wwhhoTHtp8VAjCjLsdpL+Cvl8EaOqvosijRBYbXL+YceYhAODAdAY7lsjl/KuWrDcGxE7JRxTcmLYtiRp3g6uLX4f4zqGQ0ocXa3+3QL1u7gKykjgyIvsXvuMdpCcnNsL9/DMYrMY6l0w4Stb+g1YH3pwDZEy7juZmZu9c8DiRAjcQ0exw/cW8rZudawErkE2N9OxuHCqrsUb/7BHi4wxjUp3lln+fXEJMmu2vBfAORhHNkOb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdEM7mASNWY/WlXxM2w5jqRvCc2RGprOJ3UxiIjEE2Y=;
 b=I9yKjhHsTz3Ew70RRsxTIVNH/oea4+fhaSx8FGJPOK6qq7TSjEtdmpmojLhaqMbZWQYFLVPVjVeUgfRsorkYaMczwjv4Bs6iTg+6m5k7XHW/o97V1GLOKLMYzJ/+8T1Yaes3AVFMxkpNJE30Cxip/HbTTn/xM3Y738uk4EF7IlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 10:42:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 10:42:28 +0000
Message-ID: <2e64c037-ee5a-0c60-5dba-2e48bb437014@amd.com>
Date: Mon, 15 Aug 2022 12:42:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
 <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
 <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
 <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
In-Reply-To: <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
X-ClientProxiedBy: AS8PR04CA0209.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::34) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7de8b93-6189-4f70-ccba-08da7eaad995
X-MS-TrafficTypeDiagnostic: DM4PR12MB6158:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDD2f3kXN0j78ISkvJTKvaYziZsdFefQugRGnwHkdK4YKYfIZiPYhm5SRCjA0CfWjudreATdcO8sisaO5yCxIxiQPiF1Jjf1zNS2JQAmk/VUV3i+CafXckXp6cvblnZ/FNcgRGZlLtG1Si88G3uYdBI+Gy3bmPUbT5kp2JBygpAXor9TryOXlxB+PFxPM/lXsofDIxyx+YnKs5RZ13R4l909QBocnPRRd/6L6k5TjkasmWLuyEtJZ7BEbsUW05UWmY+dnElwuU1JXVl97uiYP+ApfF997bnIoAfhAT/sdicVcN7XrIuQY95GV/P+d4G2daHz8I8X9kGggc5JTsARRRfdfNRT/Sp2sTlVk3j7PZBql7oo+NnCt67tMbpU/Mffe/zodlma+K9m7ljPJYeusqiCTvvfj6p6xxE6iwJQYBJ/CAirYwcOrrSLyPX7fr5GdNCclr3dvCBtGjxCHlkFiFgp1N8yy1llIRvBqO3tME165jtGkkr7Ms13zM+a+y6EsfuLLCgGpGz5eoBJRazROmbd5dsw5S0Gfdq8B1mEIr0N0zaxray7ABPZSCPa3fpyjx79KMuSUqxYuMH20KmcqkGFF/htCN60zWxgj5vVULmH7BCBrKIH0iW7nZA274XBkiiVcPie7yj8U6Emhv2286083zoVYfyoI9g17efWA5DAaAk4HRPkSZKqhVt0zmRDGmwjjWw8e+hMwBz4yiZsefJzsoNLKF7g9JCpG+pb6dDBMzZ/ZIg8CEqfU4DcRdmDougg73uJ6nswpJPKUcZJXEoYLgo6a4ZMgPIZbpaDen8jBgGmHf8GDfIDIAex994fhbaLSdYcKZqwWLH+xiJ73A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(2616005)(66574015)(186003)(83380400001)(6486002)(478600001)(41300700001)(38100700002)(7416002)(6666004)(5660300002)(316002)(110136005)(2906002)(8676002)(66556008)(53546011)(66946007)(6512007)(4326008)(6506007)(31696002)(36756003)(8936002)(31686004)(66476007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0J0Tm5BRDB2WXZnWjB4MnBndmUvL0gxNTVMVlFRUWNHOFZZdEtSU1dac0pZ?=
 =?utf-8?B?bzJXMWdVcHNDMkc2MnUwdldocUxYdTd3MHVuakxTNkYzOU5NUy8wL1NVbi9j?=
 =?utf-8?B?d3pyalBlSjVZS1pYVlR6Q3dPdmltUjEvMEhJUk5jblcxT3lzODRBckszWHZI?=
 =?utf-8?B?RFIzc1paOGZFNTNRV2hjQnVMbjFBTllBOGZXL2xxS0tlUkVLVEhrMDJ5aUx5?=
 =?utf-8?B?U0lhSldvZFRieS81ZG9oZWU2N0U2amM4bEFSelJ1TmtLdFJ1MFhsc1FLbmVW?=
 =?utf-8?B?a1VwMnA5aWh0SWdueWVUWS8yNlBhUFE3SzQzTThNazRwZkJLUDhqcTU5U24x?=
 =?utf-8?B?OFV1bTBBVTdDcVVzSVJ0aldhTTlxYTFiVWx4MWE0cEkxNWJGenBLYmd5RDFP?=
 =?utf-8?B?Z2NCU2FXNHFLK1lnaWlpL1hPVGMrQzV2K29IUS8zV2dmd21MbWhjU1dFT3Vu?=
 =?utf-8?B?K3g3SWNYZDdQR3lsc2JyVmgrWlhzaHJTWEVrWWpJc1JoUW8vNkI5MmY2UklK?=
 =?utf-8?B?QXdHNTBZaXgweGpKRFpESWVlOUJKL2ZTMWlKbjFNTEFNR0xpL3NXMjIyb1c4?=
 =?utf-8?B?VFRGeER2QXc1SC81T3V4ak91cFBRZHc0NVE3WUVpK1ZJWGlKTnYxUVl4WmRX?=
 =?utf-8?B?SHZ2KzU0RkNRb2dmVUZhYU1UeE9IQnZqd1BpZXlHK0ppYSsrMGRyK1RjUzJS?=
 =?utf-8?B?aHVXcTVDbU4vRFFiVGM2c0d2a2dzaE9wc2VVRGtoMk5aODU2M2oraVlpc0pi?=
 =?utf-8?B?MitIQUVma3FXR0RDVjdOa3FTdlpvbGNHWGhITzFmdnZWNU1rZWt1WXJpV2th?=
 =?utf-8?B?NlJtUWVaZUREU0pEYS9zUHNCVlozR1RBcU5CNGlnK21tQmx0ZHNxUUs2b0pu?=
 =?utf-8?B?Z05sYU1tZEZJc3VHaExkNXcrVnh0N3gyRzJnK1V2MXJoKzQxNWhRdzZ6VTlx?=
 =?utf-8?B?SHlsQkp3NnU4aHRkR0M0QWVoTUhqMHlrMjhVcHhxa1N4eDYxeUx1UVhScjJu?=
 =?utf-8?B?bkFnTGpseEhPckI5OC9mSXBLNmNzcE56R0tPL0M3SVJMSUlpS3d0WlJwdTdj?=
 =?utf-8?B?YXRIN0srUFpqYi9sbnViWGVNdlZNVG1jUVhGcmFtblNmekFZT1RKTGxtZkJp?=
 =?utf-8?B?Z0hEQzcxZG5pV2Z4YjN1ZXl2cmNzVEhTNWFQUTU0b1pmb1krb24yVjNrbkxM?=
 =?utf-8?B?Q0hCdU1LcDI3ZUsvSU5jaXFtRXZyUnZ0OWFLQ0dLQjhycW55cjFaQnJpeTlO?=
 =?utf-8?B?TjRyY1NXbnNZaXE0YVFReVJ0RnF3TXU1aHYvY1RNeHhFc2k2UitlVndVV2ts?=
 =?utf-8?B?UUk5RllsTisrbDZSalI5SHowV2tqNnlkNFU2RGNVVGh3S1M5UUFyZEZuRXBz?=
 =?utf-8?B?OTY3eDdIQU51QmhBaHY4N0hIT01pTDViT0NEVU4rSnZWK0duTHN0UVpBZzNJ?=
 =?utf-8?B?NUY2cUM4STlORFQ5akdJMTUrMXFVdUJlWFRzM3EzcmIvc3lvODFjUkRmdWln?=
 =?utf-8?B?VzM0Y2ZWWXp4aXRid1g1aEk3WHJhSVF1OTVJbXkvZStqOHpJZVlGYW5LMGRS?=
 =?utf-8?B?WEhaby85eDM5NHN2ZzBPRmdvY2R0OVgzWkRrdWkzZ0RYUUpTQVd4VjF3ZHZF?=
 =?utf-8?B?clpHNHZtU2c3ZVovdHlEUno0cGl4SGRocWFTOW9rQW8zd2U5YWNmVUZjWjJE?=
 =?utf-8?B?RlVvRndoVkJCVU8rU2RaK1ptZk1qc0VZaXk5U3ZWMFM5YmtnRHIvSHN4UDhr?=
 =?utf-8?B?VDlEeEhIRFRHMmxodmQrN1hwOW5FM05OTDVUNDA4ZVN2NnVLMHZZT1JtSm00?=
 =?utf-8?B?NW5zc01ITDZoSjdOZWdsNkRFUVo1Sk1oZ2hSOTdWMExxcEJsVjJCZVBXMms1?=
 =?utf-8?B?QUlsc1ZJTXo3b2tBOGZHaDRxS3dNZWh6ZTU5UDJueXhDampjbzY4Qy9GbFFL?=
 =?utf-8?B?VkJneVpHMVFxeEp6eDRwSTE5ZU82VkJiZ01TN25pazB3OXdUNUU5V0hqTkVO?=
 =?utf-8?B?ditsSXFDSTFNWEVaNS9UR2JRaW96cm4rb1RGejhTVTZqVUErVmJSZVlob013?=
 =?utf-8?B?WURXV1BnVEtHTCtzMERSUFgyWVlOdTlzL0lHTURVZjBRYXNGSzNGSHJuNFNY?=
 =?utf-8?B?V0JZbXp4QVROZWtIaFVOZUtTNGYzZEIyRGNyVm5KTGdUTmExQUhEM21RbjZo?=
 =?utf-8?Q?/7EJIuQoqDnytSBLbzxqttYe/3ZQX7sqz1dz388IBcaA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7de8b93-6189-4f70-ccba-08da7eaad995
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 10:42:28.8859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vpg0KmSUOQ5zTLiowY8cdDJhWJPf+5Hlz7L0ez4awi7PQ7FBGKGtpoCg19GGe/Ej
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

QW0gMTUuMDguMjIgdW0gMTI6MTggc2NocmllYiBEbWl0cnkgT3NpcGVua286Cj4gT24gOC8xNS8y
MiAxMzoxNCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTUuMDguMjIgdW0gMTI6MTEg
c2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4gQW0gMTUuMDguMjIgdW0gMTI6MDkgc2Nocmll
YiBEbWl0cnkgT3NpcGVua286Cj4+Pj4gT24gOC8xNS8yMiAxMzowNSwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPj4+Pj4gQW0gMTUuMDguMjIgdW0gMTE6NTQgc2NocmllYiBEbWl0cnkgT3NpcGVu
a286Cj4+Pj4+PiBIaWdoZXIgb3JkZXIgcGFnZXMgYWxsb2NhdGVkIHVzaW5nIGFsbG9jX3BhZ2Vz
KCkgYXJlbid0IHJlZmNvdW50ZWQgYW5kCj4+Pj4+PiB0aGV5Cj4+Pj4+PiBuZWVkIHRvIGJlIHJl
ZmNvdW50ZWQsIG90aGVyd2lzZSBpdCdzIGltcG9zc2libGUgdG8gbWFwIHRoZW0gYnkKPj4+Pj4+
IEtWTS4gVGhpcwo+Pj4+Pj4gcGF0Y2ggc2V0cyB0aGUgcmVmY291bnQgb2YgdGhlIHRhaWwgcGFn
ZXMgYW5kIGZpeGVzIHRoZSBLVk0gbWVtb3J5Cj4+Pj4+PiBtYXBwaW5nCj4+Pj4+PiBmYXVsdHMu
Cj4+Pj4+Pgo+Pj4+Pj4gV2l0aG91dCB0aGlzIGNoYW5nZSBndWVzdCB2aXJnbCBkcml2ZXIgY2Fu
J3QgbWFwIGhvc3QgYnVmZmVycyBpbnRvCj4+Pj4+PiBndWVzdAo+Pj4+Pj4gYW5kIGNhbid0IHBy
b3ZpZGUgT3BlbkdMIDQuNSBwcm9maWxlIHN1cHBvcnQgdG8gdGhlIGd1ZXN0LiBUaGUgaG9zdAo+
Pj4+Pj4gbWFwcGluZ3MgYXJlIGFsc28gbmVlZGVkIGZvciBlbmFibGluZyB0aGUgVmVudXMgZHJp
dmVyIHVzaW5nIGhvc3QgR1BVCj4+Pj4+PiBkcml2ZXJzIHRoYXQgYXJlIHV0aWxpemluZyBUVE0u
Cj4+Pj4+Pgo+Pj4+Pj4gQmFzZWQgb24gYSBwYXRjaCBwcm9wb3NlZCBieSBUcmlnZ2VyIEh1YW5n
Lgo+Pj4+PiBXZWxsIEkgY2FuJ3QgY291bnQgaG93IG9mdGVuIEkgaGF2ZSByZXBlYXRlZCB0aGlz
OiBUaGlzIGlzIGFuCj4+Pj4+IGFic29sdXRlbHkKPj4+Pj4gY2xlYXIgTkFLIQo+Pj4+Pgo+Pj4+
PiBUVE0gcGFnZXMgYXJlIG5vdCByZWZlcmVuY2UgY291bnRlZCBpbiB0aGUgZmlyc3QgcGxhY2Ug
YW5kIGJlY2F1c2Ugb2YKPj4+Pj4gdGhpcyBnaXZpbmcgdGhlbSB0byB2aXJnbCBpcyBpbGxlZ2Fs
Lgo+Pj4+IEE/IFRoZSBmaXJzdCBwYWdlIGlzIHJlZmNvdW50ZWQgd2hlbiBhbGxvY2F0ZWQsIHRo
ZSB0YWlsIHBhZ2VzIGFyZSBub3QuCj4+PiBObyB0aGV5IGFyZW4ndC4gVGhlIGZpcnN0IHBhZ2Ug
aXMganVzdCBieSBjb2luY2lkZW50IGluaXRpYWxpemVkIHdpdGgKPj4+IGEgcmVmY291bnQgb2Yg
MS4gVGhpcyByZWZjb3VudCBpcyBjb21wbGV0ZWx5IGlnbm9yZWQgYW5kIG5vdCB1c2VkIGF0IGFs
bC4KPj4+Cj4+PiBJbmNyZW1lbnRpbmcgdGhlIHJlZmVyZW5jZSBjb3VudCBhbmQgYnkgdGhpcyBt
YXBwaW5nIHRoZSBwYWdlIGludG8KPj4+IHNvbWUgb3RoZXIgYWRkcmVzcyBzcGFjZSBpcyBpbGxl
Z2FsIGFuZCBjb3JydXB0cyB0aGUgaW50ZXJuYWwgc3RhdGUKPj4+IHRyYWNraW5nIG9mIFRUTS4K
Pj4gU2VlIHRoaXMgY29tbWVudCBpbiB0aGUgc291cmNlIGNvZGUgYXMgd2VsbDoKPj4KPj4gIMKg
wqDCoMKgwqDCoMKgIC8qIERvbid0IHNldCB0aGUgX19HRlBfQ09NUCBmbGFnIGZvciBoaWdoZXIg
b3JkZXIgYWxsb2NhdGlvbnMuCj4+ICDCoMKgwqDCoMKgwqDCoMKgICogTWFwcGluZyBwYWdlcyBk
aXJlY3RseSBpbnRvIGFuIHVzZXJzcGFjZSBwcm9jZXNzIGFuZCBjYWxsaW5nCj4+ICDCoMKgwqDC
oMKgwqDCoMKgICogcHV0X3BhZ2UoKSBvbiBhIFRUTSBhbGxvY2F0ZWQgcGFnZSBpcyBpbGxlZ2Fs
Lgo+PiAgwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pgo+PiBJIGhhdmUgYWJzb2x1dGVseSBubyBpZGVh
IGhvdyBzb21lYm9keSBoYWQgdGhlIGlkZWEgaGUgY291bGQgZG8gdGhpcy4KPiBJIHNhdyB0aGlz
IGNvbW1lbnQsIGJ1dCBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgYmVjYXVzZSBpdCBkb2Vzbid0IGV4
cGxhaW4KPiB3aHkgaXQncyBpbGxlZ2FsLiBIZW5jZSBpdCBsb29rcyBsaWtlIGEgYm9ndXMgY29t
bWVudCBzaW5jZSB0aGUKPiByZWZjb3V0aW5nIGNlcnRhaW5seSB3b3JrcywgYXQgbGVhc3QgdG8g
YSBzb21lIGRlZ3JlZSBiZWNhdXNlIEkgaGF2ZW4ndAo+IG5vdGljZWQgYW55IHByb2JsZW1zIGlu
IHByYWN0aWNlLCBtYXliZSBieSBsdWNrIDopCgpXZWxsIGV4YWN0bHkgdGhhdCdzIHRoZSBwcm9i
bGVtLiBJdCBkb2VzIG5vdCB3b3JrLCB5b3UgYXJlIGp1c3QgbHVja3kgOikKCkkgd2lsbCBwcm92
aWRlIGEgcGF0Y2ggdG8gc2V0IHRoZSByZWZlcmVuY2UgY291bnQgdG8gemVybyBldmVuIGZvciAK
bm9uLWNvbXBvdW5kIHBhZ2VzLiBNYXliZSB0aGF0IHdpbGwgeWllbGQgbW9yZSBiYWNrdHJhY2Ug
dG8gYWJ1c2VycyBvZiAKdGhpcyBpbnRlcmZhY2UuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4g
SSdsbCB0cnkgdG8gZGlnIG91dCB0aGUgb2xkZXIgZGlzY3Vzc2lvbnMsIHRoYW5rIHlvdSBmb3Ig
dGhlIHF1aWNrIHJlcGx5IQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
