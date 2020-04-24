Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD0C1B81A0
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 23:27:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A06DE87715;
	Fri, 24 Apr 2020 21:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSlkWHgKaiHH; Fri, 24 Apr 2020 21:27:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9AA89877D3;
	Fri, 24 Apr 2020 21:27:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A601C0175;
	Fri, 24 Apr 2020 21:27:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B47AC0175
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A26386892
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 21:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPlcUTaf_aR8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 21:27:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C4A798687B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 21:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IF/LoJB2mYZllic4z+nkUSvnAIJFQdA7EgGf0cH8Ox3O8Gs2glfYZX0wx0j/vUl0Appb2qHUx1wWwLsAmUUGdp3evby5GnAVLSfMVpNoEVLYssSkIBNQTsE8LS38odik8reZ8xsgG1RwLCnVkaSoHbUg+9WW2IsR/LcT8yrWG+t1qTAfJ6uCs8r27AAKK8HPfyEXmk6keQUqb4THs285CFyvw5GQePrMYmogUFY8nEsrsFmDHYZuPfs5yQcIcXwyZNU/TiO05EHbpEnbcrz+kR5u0wJGrpYcX8VSiR6Ze5aSscqmzKPsQH9br8uYUk4BUIqopp/HFFJPvj2hk1e2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXPwJEHMUd1Pb8WSoTwVTlGPBsQhkZh2PuV0ssteSI0=;
 b=Ui7iZuFeEQ8k02ANy/SMOTiOUrl7L3IEZjELiBa+pz4PYk1ZmhFjN+JqWpiGKrvLVZk5OlCS1kEz0QvmT6PWy8/J8z43oWvApH9UoxaadOF0VRqBJp51sPG3XDLtxOkjXyzkRZZgQ7kn9FEQiFMaQiRN2pQo4Z0Jl1Lr9qdgmM58UYoAjc9yxRT45OUpZNMhKnHU/2Py/MJE47xevC0z9zr9np3WYChfA6yYfvJQdpiSbQFGVqIC4kuALCZo15bkAHRz/jcxitjzGFaVwOWsvdyOxSDAC519eb1oxoavW9HNbWEZypxwEYWPGwCQZJLgAwoFfNZO4Gq7/D+V0KzAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXPwJEHMUd1Pb8WSoTwVTlGPBsQhkZh2PuV0ssteSI0=;
 b=S1kokANAn1gzMJ0ZWXiSSpny6W4HtRgQp51Z8tMBNYU3HCrH5/1/EV+K1vpDUeUzAOwXuHfAFNkJxfQN/odM8ohkGNbInwNPxY4Z4tDrxuSlM2ETvN//RMamoNHojZemC3kYGez9wC0jQW+o7FGtH6i98tY4uOvlaGZRNd3qBqU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thomas.Lendacky@amd.com; 
Received: from DM6PR12MB3163.namprd12.prod.outlook.com (2603:10b6:5:15e::26)
 by DM6PR12MB3562.namprd12.prod.outlook.com (2603:10b6:5:3c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 24 Apr
 2020 21:27:35 +0000
Received: from DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::9ae:cb95:c925:d5bf]) by DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::9ae:cb95:c925:d5bf%4]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 21:27:35 +0000
Subject: Re: [PATCH] Allow RDTSC and RDTSCP from userspace
To: Dave Hansen <dave.hansen@intel.com>, Mike Stunes <mstunes@vmware.com>,
 joro@8bytes.org
References: <20200319091407.1481-56-joro@8bytes.org>
 <20200424210316.848878-1-mstunes@vmware.com>
 <2c49061d-eb84-032e-8dcb-dd36a891ce90@intel.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <ead88d04-1756-1190-2b37-b24f86422595@amd.com>
Date: Fri, 24 Apr 2020 16:27:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <2c49061d-eb84-032e-8dcb-dd36a891ce90@intel.com>
Content-Language: en-US
X-ClientProxiedBy: SN6PR01CA0035.prod.exchangelabs.com (2603:10b6:805:b6::48)
 To DM6PR12MB3163.namprd12.prod.outlook.com
 (2603:10b6:5:15e::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN6PR01CA0035.prod.exchangelabs.com (2603:10b6:805:b6::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Fri, 24 Apr 2020 21:27:33 +0000
X-Originating-IP: [67.79.209.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd7ab3d7-0a07-41bc-b92e-08d7e8964e35
X-MS-TrafficTypeDiagnostic: DM6PR12MB3562:
X-Microsoft-Antispam-PRVS: <DM6PR12MB356267AFF979E5B474114EAAECD00@DM6PR12MB3562.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3163.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(478600001)(2616005)(956004)(52116002)(4744005)(7416002)(2906002)(26005)(53546011)(31686004)(81156014)(6506007)(8936002)(8676002)(186003)(16526019)(4326008)(5660300002)(6512007)(66556008)(86362001)(66946007)(66476007)(31696002)(36756003)(6486002)(316002)(110136005);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 467goDWZkBEpkhxfDCvcgqEtMW+Lim/F49AB/25Xqk/MsCPCyh+eNLBZGw8qn2J4p1GGXovUvNCflRpjhTwJaFdztA/1m6BbF8N0gLbhs3U3yv1AIt8lXWRY5DZhy0a/W/nW2PMN32OaoGdKrjsv6gCAoAqBsePjUQNG/FJbJkxEKsJfnRyU2D9MWGa98Tt7thgg3xrVg4ZFPedq7RaR2Mg8rHOTPSc4VIyAHTsfjnRZNzoPC+g/DNbtgOHqs3e/aqELCZk87+2S957dR9seNnZvPxf0bAh8BMprnYFMGsbUtgjSrxjxwxOka+lyp0ZweVwlWAxL3ZlIWKDvJhjISOQE02YOh8DZ/Rjn/aRsSafzaJN5yi6dRXsw0RDndh0aUy2xhlGGz7+5NKLOPmcgVDKraSa5yLtBLzRa9gSSGBT7TQQnvr1y6TlCqjRQ4fY+
X-MS-Exchange-AntiSpam-MessageData: zBUyL3Gl7tEpnK9HD3KtpImY9QLwB48p5d3nbMSGELqJeiAWUpVBKOJmT6KKu6k9IosXG3mXfybmK3hzom/yP7JJBjtqXGA3nhye/QV6uHUeYvbhQVcbjpM5oQB0qzl+Nh+BiE8rFzLzKWffDLo+5/8Y9ZaCUVnAW+Q1IlfwZSco8uLzJVJN2E+PNm6kDp8BtyPqNmyrEQ90PUmxfLpguQY+amIf2SWhXBA76KFevjOGB7AainOXC7FwTUwAXg1SdQWjOdz0Fis+ylJqSfn3+mbjUxEMYpIhRul/9Aql1eI5Ms3BgKELTLiWRAb3tC64Ek1llicsI60l/KoaK+vkMmj1RMU8V3FyLUH5DedmTAul1ZIfa5jLY+CMZtJxd9eha1qSIiW0zjWD8KwjpgTkg070yQyQmtK2+muAL1w/8CKQio9kDquIp7e3Dl3cIN31DAGVMb9J//hn9IXM6ZYgVR9DJLY5S41FKv53zD/akX5Ww7zEkkCD4b9xYEP5WPtHyfJv7XbejOUFuw/02tK+pLeUZ0tquY5/V4L3X14X5lQ4e4HrgCKLaGQ2m0rlNPIhMl+s8TPeiqWp+5qRLpCxr+VKbusxut+1GHLpX/UosrnxqspP3rSoc3eTAysJBCxHJhFYkZJ2PfGK3MXUmLsFRbEYJ0hjSt76qHKXKGTC7ZOag9HU6BCAFgGPvPjtOzm7RtrpsKwBrDG4AsA3Ut2A4+R7po6lDwlOFNYppoionsl98yZPzabDA2bke+wf+Y3mfqwTKry/1rPHy1rUjFmJ6Qy8rz9TSOlDtez/dRcdFjM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7ab3d7-0a07-41bc-b92e-08d7e8964e35
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 21:27:35.2595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9RXoA/3AHh87XPc4HN4aYawXMIxeB/Dbz3DJ/H5rJI0aZiNqtWaU6bviMUqO91ugEJUoULYKTPZNpxvVfdLRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3562
Cc: jgross@suse.com, x86@kernel.org, thellstrom@vmware.com, jroedel@suse.de,
 keescook@chromium.org, kvm@vger.kernel.org, peterz@infradead.org,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org, luto@kernel.org, hpa@zytor.com,
 dan.j.williams@intel.com, jslaby@suse.cz
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 4/24/20 4:24 PM, Dave Hansen wrote:
> On 4/24/20 2:03 PM, Mike Stunes wrote:
>> I needed to allow RDTSC(P) from userspace and in early boot in order to
>> get userspace started properly. Patch below.
>>
>> ---
>> SEV-ES guests will need to execute rdtsc and rdtscp from userspace and
>> during early boot. Move the rdtsc(p) #VC handler into common code and
>> extend the #VC handlers.
> 
> Do SEV-ES guests _always_ #VC on rdtsc(p)?

Only if the hypervisor is intercepting those instructions.

Thanks,
Tom

> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
